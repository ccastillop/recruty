class UserPolicy < ApplicationPolicy

  def permitted_attributes
    pp = [:first_name, :last_name, :curriculum_vitae]
    if user.admin? 
      pp
    else
      pp + [:level]
    end
  end

  def normal_can_modify?
    user == record
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
