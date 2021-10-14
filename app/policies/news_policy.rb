class NewsPolicy < ApplicationPolicy
  class Scope < Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end
    def resolve
      scope.all
    end
  end

  def destroy?
    user.admin?
  end

  def new?
    user.premium? || user.admin?
  end

  def edit?
    (user.premium? && user == record.user) || user.admin?
  end

  def update?
    (user.premium? && user == record.user) || user.admin?
  end
end
