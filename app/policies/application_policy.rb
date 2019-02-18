class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def can_modify?
    user.admin? || normal_can_modify?
  end

  # These are the defaults policies for each action
  [:new?, :create?, :edit?, :update?, :destroy?, :index?, :show?].each do |m|
    alias_method m, :can_modify?
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.admin?
        scope
      else user.normal?
        scope.where(user_id: user.id)
      end
    end
  end

  private

    def normal_can_modify?
      record.user.present? && record.user == user
    end

end
