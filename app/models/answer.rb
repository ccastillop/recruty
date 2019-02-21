class Answer < ApplicationRecord
  belongs_to :quiz
  belongs_to :question
  belongs_to :choice, optional: true

  # validate :check_radio_one_choice_answered
  # validate :booly_answered

  # def check_radio_one_choice_answered
  #   errors.add(:choice_id) if (question.kind=="checkbox" || question.kind=="radiobutton") && quiz.answers.select{|a| a.booly==true }.size == 0
  # end

  # def booly_answered
  #   errors.add(:booly) if question.kind=="boolean" && booly==nil
  # end

end
