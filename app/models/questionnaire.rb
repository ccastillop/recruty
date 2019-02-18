class Questionnaire < ApplicationRecord
  has_many :questions
  validates :name, presence: true

  def to_s
    name
  end
  
end
