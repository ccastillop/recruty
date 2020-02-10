class QuizFilter
  include ActiveModel::Model
  attr_accessor :terms,
                :start_date, :end_date

  def initialize(attributes = {})
    super
    @start_date   = @start_date.try(:to_date) rescue nil
    @end_date     = @end_date.try(:to_date) rescue nil
  end
  
  def filter(quizzes)

    quizzes = quizzes.where("quizzes.updated_at > ?", start_date) if start_date
    quizzes = quizzes.where("quizzes.updated_at < ?", end_date) if end_date
    
    if terms && terms.size > 1

    quizzes = quizzes.joins(:user, :questionnaire)
      .where("( questionnaires.name like :terms OR 
      quizzes.comments like :terms OR
      users.name like :terms OR
      users.email like :terms )", terms: "%#{terms}%")
      
    end
    quizzes
  end

end