class ApplicationController < ActionController::Base
  include Pundit::Authorization
  
  protect_from_forgery with: :exception
  before_action :authenticate_user!


  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "Sorry, You Are Not Authorized To Do This"
    redirect_to(request.referrer || root_path)
  end
end
