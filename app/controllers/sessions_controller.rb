class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email])

    if user&.authenticate(params[:session][:password])
      sign_in user

      redirect_to store_index_path, alert: "Signed in successfully."
    else
      flash.now[:alert] = "Verify your Email and Password, please."
      render :new
    end
  end

  def destroy
    sign_out
    flash.now[:alert] = "Signed out successfully."
    redirect_to root_path
  end
end
