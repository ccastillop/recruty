class QuizPolicy < ApplicationPolicy
  
  def permitted_attributes
    att = [:questionnaire_id,
        answers_attributes:[
          :id,
          :question_id,
          :choice_id,
          :body,
          :booly
        ]
      ]
    if user.admin?
      att + [:state, :comments]
    else
      att
    end    
  end

  class Scope < Scope
    def resolve
      if user.admin?
        scope
      elsif user.normal?
        scope.where(user_id: user.id)
      else
        scope.none
      end
    end
  end

  private

    def normal_can_modify?
      record.user.present? && record.user == user
    end

end
