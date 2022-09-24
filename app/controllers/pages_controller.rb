class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @products = Product.where(quantity_in_stock: 0).sort_by { |element| element.title }
    @supplier_orders = Order.joins(:order_lines).where(order_lines: { product: @products}, client_id: nil, status: 0).uniq
    @missing_products = @products.reject { |p| p.order_lines.last.order.planned_delivery_date > Date.today unless p.order_lines.blank? }
    @order_line = OrderLine.new
    @order = Order.new
  end
end
