class Api::V1::OrdersController < Api::BaseController
  before_action :authentication_user!

  def index
    orders = Order.all
    respond_with_success orders
  end
end
