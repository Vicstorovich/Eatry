class ApplicationController < ActionController::Base
  def authenticate_user!
    unless current_user
      redirect_to login_path, alert: "Verify your Email and Password, please."
    end
  end

  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session[:user_id] = nil
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id].present?
  end

  helper_method :current_user

  def user_signed_in?
    current_user.present?
  end

  helper_method :user_signed_in?
end
