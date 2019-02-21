class Answer < ApplicationRecord
  belongs_to :quiz
  belongs_to :question
  belongs_to :choice, optional: true

end
