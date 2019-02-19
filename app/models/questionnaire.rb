class Questionnaire < ApplicationRecord
  has_many :questions, dependent: :restrict_with_error
  has_many :quizzes, dependent: :restrict_with_error
  validates :name, presence: true

  def to_s
    name
  end
  
end
