class User < ApplicationRecord
  has_many :quizzes

  def admin?
    level == 'admin'
  end

  def normal?
    level == 'normal'
  end

  def to_s
    name
  end

  def available_questionnaires
    questionnaire_ids = quizzes.map{|q| q.questionnaire_id }
    Questionnaire.where.not(id: questionnaire_ids)
  end

end
