class Admin::OrdersController < Admin::ApplicationController
  def index
    @orders = Order.all
  end

  def show; end

  def destroy
    order.destroy

    redirect_to admin_orders_path, notice: 'Order was successfully destroyed.'
  end

  private

  def order
    @order = Order.find(params[:id])
  end

  helper_method :order
end
