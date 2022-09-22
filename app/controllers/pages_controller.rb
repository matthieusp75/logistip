class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @supplier_orders = Order.all.where(status: 0, client_id: nil)
    @products = Product.where(quantity_in_stock: 0).sort_by { |element| element.title }
    @missing_products = missing(@products)
    @order_line = OrderLine.new
    @order = Order.new
  end

  private

  def missing(products)
    products.each do |product|
      if product.order_lines.count > 0
        if product.order_lines.last.order.planned_delivery_date > Date.today
          products.delete(product)
        end
      end
    end
  end
end
