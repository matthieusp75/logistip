class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @products = Product.where(quantity_in_stock: 0).sort_by { |element| element.title }
    @order_line = OrderLine.new
    @order = Order.new
  end
end
