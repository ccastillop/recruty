class UserPolicy < ApplicationPolicy

  def can_modify?
    user.admin? || user == record
  end

  def permitted_attributes
    pp = [:first_name, :last_name, :curriculum_vitae]
    if user.admin? 
      pp
    else
      pp + :level
    end
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
