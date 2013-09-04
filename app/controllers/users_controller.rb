require_relative "../models/user"

class UsersController < ApplicationController
  # app/controllers/users_controller.rb
  # skip_before_filter :require_login, :only => [:index]

  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
    @workdays = Workday.where(["person_1_id = ? or person_2_id = ?", @user.id, @user.id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to @user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to @user
  end

  private
  def user_params
    params.require(:user).permit(:name, :username, :password, :admin, :comments, :phone, :email, :started_date, :quit_date, :active)
  end

end