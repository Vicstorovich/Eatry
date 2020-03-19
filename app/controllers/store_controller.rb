class StoreController < ApplicationController
  include CurrentCart

  before_action :authenticate_user!
  before_action :set_cart, only: :show

  def index
    @menus = Menu.all
    # @products = Product.order(:title)
  end

  def show
    menu

    @categories = Category.all
  end

  private

  def menu
    @menu = Menu.find(params[:id])
  end

  helper_method :menu
end
