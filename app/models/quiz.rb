class Quiz < ApplicationRecord
  belongs_to :user
  belongs_to :questionnaire
  has_many :answers
  before_save :persist_state

  accepts_nested_attributes_for :answers, reject_if: proc { |atts| atts['choice_id']=="0" }

  def machine
    @machine ||= begin
      fsm = MicroMachine.new(state || "pending")

      fsm.when(:confirm, "pending" => "confirmed")
      fsm.when(:cancel, "confirmed" => "cancelled")
      fsm.when(:reset, "confirmed" => "pending", "cancelled" => "pending")

      fsm
    end 
  end

  # def prepare_answers!
  #   ans = answers.to_a
  #   questionnaire.questions.each do |question|
  #     as = ans.select{|a| a.question_id == question.id }
  #     if question.kind == "text" || question.kind == "boolean"
  #       unless as.first
  #         answers.build(question_id: question.id)
  #       end
  #     else
  #       question.choices.each do |choice|
  #         ass = as.select{|a| a.choice_id == choice.id}
  #         unless ass.first
  #           answers.build(question_id: question.id, choice_id: choice.id)
  #         end
  #       end
  #     end
  #   end
  # end

  private
  def persist_state
    self.state = machine.state
  end

end
