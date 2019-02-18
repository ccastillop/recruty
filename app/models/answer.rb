class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :questionnarie
  belongs_to :question
  belongs_to :choice
end
