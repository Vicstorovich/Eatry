class Admin::MenusController < Admin::ApplicationController
  def index
    @menus = Menu.all.page(params[:page]).per(2)
  end

  def show
    @categories = Category.all
  end

  def create
    if Menu.create_menu
      redirect_to admin_menus_path, notice: 'Menu was successfully created.'
    else
      redirect_to admin_menus_path, notice: 'No menu is created today!!!'
    end
  end

  def destroy
    menu.destroy
    redirect_to admin_menus_path, notice: 'Menu was successfully deleted.'
  end

  private

  def menu
    @menu ||= Menu.find(params[:id])
  end
  helper_method :menu
end
