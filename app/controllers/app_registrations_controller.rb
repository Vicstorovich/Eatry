class AppRegistrationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @app = App.new
  end

  def create
    @app = App.new(app_params)

    if @app.save
      session[:app_id] = @app.id

      redirect_to store_index_path, notice: 'Registration was successful.'
    else
      render :new
    end
  end

  private

  def app_params
    params.require(:app).permit(:email, :password, :password_confirmation)
  end
end
