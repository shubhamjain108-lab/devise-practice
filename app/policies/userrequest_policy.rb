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

  
end
