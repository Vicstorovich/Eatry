class LineItemsController < ApplicationController
  include CurrentCart

  before_action :authenticate_user!
  before_action :set_cart, only: [:create]

  def index
    @line_items = LineItem.all
  end

  def create
    product = Product.find(params[:product_id])
    menu = Menu.find(params[:menu_id])
    line_item = @cart.add_product(product, menu)

    if !line_item.nil?
      line_item.set_category(product)

      if line_item.save
        redirect_to store_path(menu.id),
                    notice: 'Your choice of food is excellent.'
      end
    else
      redirect_to store_path(menu.id),
                  notice: "You can not select a dish in this category again!!!"
    end
  end

  def destroy
    line_item = LineItem.find(params[:id])
    menu = line_item.menu_id
    line_item.destroy

    redirect_to store_path(menu),
                notice: 'The selected dish has been removed from your order'
  end
end
