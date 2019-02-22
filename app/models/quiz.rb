class Quiz < ApplicationRecord
  belongs_to :user
  belongs_to :questionnaire
  has_many :answers
  before_save :persist_state

  accepts_nested_attributes_for :answers, reject_if: proc { |atts| atts['choice_id']=="0" }

  validate :radios
  validate :booleans

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
    errors.count > 0 && (
      ("radiobutton"==question.kind && answers.to_a.select{ |a| a.question_id == question.id }.count == 0) || 
      ("boolean"==question.kind && answers.to_a.select{ |a| a.question_id == question.id && a.booly==nil }.count > 0)  )
  end

  private
  def persist_state
    self.state = machine.state
  end

  def to_s
    questionnaire.to_s
  end

  def radios
    q_ids = questionnaire.questions.where(kind: "radiobutton").pluck(:id)
    #exists one answer per each question
    if q_ids.select{|q_id| answers.to_a.select{|a| a.question_id==q_id}.count == 0 }.size > 0
      errors.add(:base, "Elige una opción")
    end
  end

  def booleans
    q_ids = questionnaire.questions.where(kind: "boolean").pluck(:id)
    #exists one answer per each question
    if q_ids.select{|q_id| answers.to_a.select{ |a| a.question_id==q_id && a.booly==nil }.count > 0 }.size > 0
      errors.add(:base, "Responde con verdadero o falso")
    end
  end

end
