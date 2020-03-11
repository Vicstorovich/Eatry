class StoreController < ApplicationController
  include CurrentCart

  before_action :authenticate_user!
  before_action :set_cart

  def index
    @menus = Menu.all
    @products = Product.order(:title)
  end

  def show
    @menu = Menu.all.last

    @categories = Category.all
  end
end
