class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :questionnaire
  belongs_to :question
  belongs_to :choice
end
