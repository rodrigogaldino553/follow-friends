class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit ]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit([:email, :password, :password_confirmation, :avatar, :name, :status])
  end
end
