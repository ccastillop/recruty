class Answer < ApplicationRecord
  belongs_to :quiz
  belongs_to :question
  belongs_to :choice, optional: true

  # validate :real_choice

  # def real_choice
  #   errors.add(:choice_id) if question.kind=="checkbox" && choice_id.blank?
  # end

end
