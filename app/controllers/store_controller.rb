class StoreController < ApplicationController
  before_action :authenticate_user!
  def index
    @menus = Menu.all
  end

  def show
    @menu = Menu.find(params[:id])
    @categories = Category.all
  end
end
