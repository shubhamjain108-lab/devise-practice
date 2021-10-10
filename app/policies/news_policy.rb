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
    p user
    user.admin?
  end
end
