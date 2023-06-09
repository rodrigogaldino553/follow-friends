class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update posts assign_role ]
  skip_before_action :authenticate_user!, only: %i[index show posts]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_show_path(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }    
      end
    end
  end

  def posts
    @posts = Post.user_posts(@user).order(created_at: :at) # o correto seria o posts controller fazer isso
  end

  def assign_role
    @user.assign_role(:checked)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :avatar, :status)
  end
end
