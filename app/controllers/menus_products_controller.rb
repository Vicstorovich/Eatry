class MenusProductsController < ApplicationController
  def index; end

  def create
    if !menu.product?(product)
      menu.products << product
      redirect_to  menu_path(menu)
    else
      redirect_to  menu_path(menu), notice: 'The product is already added to the menu!!!'
    end
  end

  def destroy
    menu.products.delete(product)
    redirect_to menu_path(menu), notice: 'Product was successfully destroyed from the menu.'
  end

  private

  def menu
    @menu ||= Menu.find(params[:menu_id])
  end

  def product
    @product ||= Product.find(params[:id])
  end
end
