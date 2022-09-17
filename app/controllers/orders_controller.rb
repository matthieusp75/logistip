class OrdersController < ApplicationController
  def index
    @orders = policy_scope(Order)
  end

  def show
    @order = Order.find(params[:id])
    @supplier = @order.order_lines.first.supplier
    authorize @order
  end

  def validate
    @order = Order.find(params[:id])
    @order.update(validate_params)
    authorize @order
    if @order.save!
      redirect_to orders_path
    else
      redirect_to order_path(@order)
    end
  end

  private

  def validate_params
    params.require(:order).permit(:status)
  end
end
