class MenusController < ApplicationController
  def index
    @menus = Menu.all
  end

  def show
    @categories = Category.all
  end

  def create
    if Menu.create_menu
      redirect_to menus_url
    else
      redirect_to menus_url, notice: 'No menu is created today!!!'
      flash[:notice] = 'No menu is created today!!!'
    end
  end

  def destroy
    menu.destroy
    redirect_to menus_url
  end

  private

  def menu
    @menu ||= Menu.find(params[:id])
  end
  helper_method :menu
end
