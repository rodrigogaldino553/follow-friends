class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit posts ]
  skip_before_action :authenticate_user!, only: %i[index show posts]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def posts
    @posts = Post.user_posts(@user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit([:email, :password, :password_confirmation, :avatar, :name, :status])
  end
end
