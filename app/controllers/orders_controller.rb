class OrdersController < ApplicationController

  def index
    @orders = policy_scope(Order)
  end

  def show
    @order = Order.find(params[:id])
    authorize @order
  end
end
