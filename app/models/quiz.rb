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

  private
  def persist_state
    self.state = machine.state
  end

end
