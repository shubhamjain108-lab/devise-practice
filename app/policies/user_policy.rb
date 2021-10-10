class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  attr_reader :user, :users

  def initialize(user, users)
    @user = user
    @users = users
  end

  def index?
    user.role == 'admin' || record.user == user
  end
end
