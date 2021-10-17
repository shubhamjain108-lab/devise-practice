class UserrequestPolicy < ApplicationPolicy
  class Scope < Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end
    def resolve
      scope.all
    end
  end

  def response?
    (user.admin? && user == record.user)
  end

  def show?
    (user.admin? && user == record.user)
  end

  def destroy?
    user.admin?
  end

  def edit?
    (user.premium? && user == record.user) || user.admin?
  end

  def update?
    (user.premium? && user == record.user) || user.admin?
  end
end
