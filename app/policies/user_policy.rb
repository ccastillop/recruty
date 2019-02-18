class UserPolicy < ApplicationPolicy

  def can_modify?
    user.admin? || user == record
  end

  class Scope < Scope
    def resolve
      if user.admin?
        scope
      elsif user.normal?
        scope.where(id: user.id)
      else
        scope.none
      end
    end
  end

end
