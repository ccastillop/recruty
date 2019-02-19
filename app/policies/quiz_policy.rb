class QuizPolicy < ApplicationPolicy

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

end
