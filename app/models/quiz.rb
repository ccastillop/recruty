class Quiz < ApplicationRecord
  belongs_to :user
  belongs_to :questionnaire
  has_many :answers
  before_save :persist_state

  accepts_nested_attributes_for :answers#, reject_if: proc { |atts| atts['choice_id']==nil && atts['booly']==nil }

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
      ("radiobutton"==question.kind && answers.to_a.select{ |a| a.question_id == question.id && a.choice_id==nil}.count > 0) || 
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
    questionnaire.questions.where(kind: "radiobutton").each do |question|
      #must exists at least one answer per each question
      if answers.to_a.select{|a| a.question_id==question.id && a.choice_id==nil }.size > 0 
        errors.add(:base, "Elige una opción para '#{question}'")
      end
    end
  end

  def booleans
    questionnaire.questions.where(kind: "boolean").each do |question|
      #all answers must be answered with true or false
      if answers.to_a.select{ |a| a.question_id==question.id && a.booly==nil }.size > 0
        errors.add(:base, "Responde con verdadero o falso la pregunta: '#{question}' ")
      end
    end
  end

end
