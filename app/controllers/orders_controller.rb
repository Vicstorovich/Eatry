class OrdersController < ApplicationController
  include CurrentCart

  before_action :authenticate_user!
  before_action :set_cart, only: %i[new create show]

  def new
    if @cart.line_items.empty?
      redirect_to store_index_path, notice: "Your cart is empty"
      return
    end

    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(@cart)

    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      redirect_to store_index_path, notice: 'Thank you for your order.'
    else
      render action: 'new'
    end
  end

  private

  def order
    @order = Order.find(params[:id])
  end

  helper_method :order

  def order_params
    params.require(:order).permit(:name, :address, :email)
  end
end
