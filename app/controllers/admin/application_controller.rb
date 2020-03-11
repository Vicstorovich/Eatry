class Admin::ApplicationController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  def check_admin
    redirect_to root_path, alert: "Нет прав" unless current_user.admin?
  end
end
