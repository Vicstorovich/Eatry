class CartsController < ApplicationController
  def destroy
    cart.destroy if cart.id == session[:cart_id]
    session[:cart_id] = nil
    redirect_to store_path, notice: 'Теперь ваша корзина пуста!'
  end

  private

  def cart
    @cart = Cart.find(params[:id])
  end

  helper_method :cart
end
