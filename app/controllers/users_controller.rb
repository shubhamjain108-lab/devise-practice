class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[ index show edit new update destroy ]

  def new
    @users = User.new
  end

  def index
    authorize current_user
    @users = User.all
    p "user jain"
    p @users
  end

  def show
    @user = User.find(params[:id])
  end
end
