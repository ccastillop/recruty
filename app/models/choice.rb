class Choice < ApplicationRecord
  belongs_to :question
  validates :body, presence: true
  def to_s
    body
  end
end
