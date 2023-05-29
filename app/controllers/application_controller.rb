class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  include Pundit::Authorization


  def after_sign_in_path_for(resource)
    root_path
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "Sorry, You Are Not Authorized To Do This"
    redirect_to(request.referrer || root_path)
  end
end
