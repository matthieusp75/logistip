class OrdersController < ApplicationController
  def index
    @orders = policy_scope(Order)
    # Pour les badges sur les titres
    @products = Product.where(quantity_in_stock: 0).sort_by { |element| element.title }
    @supplier_orders = Order.joins(:order_lines).where(order_lines: { product: @products}, client_id: nil, status: 0).uniq
    @missing_products = @products.reject { |p| p.order_lines.last.order.planned_delivery_date > Date.today unless p.order_lines.blank? }
  end

  def show
    @order = Order.find(params[:id])
    @order_line = OrderLine.new
    @supplier = @order.order_lines.first.supplier
    @products = @supplier.products.reject { |p| @order.products.include?(p) }
    authorize @order
    # Pour les badges sur les titres
    @products = Product.where(quantity_in_stock: 0).sort_by { |element| element.title }
    @supplier_orders = Order.joins(:order_lines).where(order_lines: { product: @products}, client_id: nil, status: 0).uniq
    @missing_products = @products.reject { |p| p.order_lines.last.order.planned_delivery_date > Date.today unless p.order_lines.blank? }
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
