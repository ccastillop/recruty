class Question < ApplicationRecord
  has_many :choices
  belongs_to :questionnarie

  def to_s
    body
  end
end
