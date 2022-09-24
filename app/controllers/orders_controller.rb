class OrdersController < ApplicationController
  def index
    @orders = policy_scope(Order)
  end

  def show
    @order = Order.find(params[:id])
    @order_line = OrderLine.new
    @supplier = @order.order_lines.first.supplier
    @products = @supplier.products.reject { |p| @order.products.include?(p) }
    authorize @order
  end

  def validate
    @order = Order.find(params[:id])
    @order.update(validate_params)
    @supplier = @order.order_lines.last.supplier
    @order.update(planned_delivery_date: Date.today + @supplier.shipping_date_minimum_period + 2)
    authorize @order
    redirect_to order_path(@order)
  end

  private

  def validate_params
    params.require(:order).permit(:status)
  end
end
