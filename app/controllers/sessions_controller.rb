class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email])

    if user&.authenticate(params[:session][:password])
      sign_in user

      redirect_to store_index_path
    else
      flash.now[:alert] = "Verify your Email and Password, please."
      render :new
    end
  end

  def destroy
    sign_out

    redirect_to root_path
  end
end
