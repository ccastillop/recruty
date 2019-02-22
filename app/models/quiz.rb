class Quiz < ApplicationRecord
  belongs_to :user
  belongs_to :questionnaire
  has_many :answers
  before_save :persist_state

  accepts_nested_attributes_for :answers, reject_if: proc { |atts| atts['choice_id']=="0" }

  validate :radios_boolys

  def machine
    @machine ||= begin
      fsm = MicroMachine.new(state || "pending")

      fsm.when(:confirm, "pending" => "confirmed")
      fsm.when(:cancel, "confirmed" => "cancelled")
      fsm.when(:reset, "confirmed" => "pending", "cancelled" => "pending")

      fsm
    end 
  end

  def mark_error?(question)
    !valid? && %w(radiobutton boolean).include?(question.kind) && answers.where(question_id: question.id).count == 0
  end

  private
  def persist_state
    self.state = machine.state
  end

  def to_s
    questionnaire.to_s
  end

  def radios_boolys
    q_ids = questionnaire.questions.where(kind: %w(radiobutton boolean)).pluck(:id)
    #exists one answer per each question
    if q_ids.map{|q_id| answers.where(question_id: q_id).count == 0 }.size > 0
      errors.add(:base, "Alguna pregunta para elegir requiere al menos una respuesta")
    end
  end


end
