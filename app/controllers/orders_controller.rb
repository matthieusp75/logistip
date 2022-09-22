class OrdersController < ApplicationController
  def index
    @orders = policy_scope(Order)
    # Pour les badges sur les titres
    @supplier_orders = Order.all.where(status: 0, client_id: nil)
    @products = Product.where(quantity_in_stock: 0).sort_by { |element| element.title }
    @missing_products = missing(@products)
  end

  def show
    @order = Order.find(params[:id])
    @supplier = @order.order_lines.first.supplier
    authorize @order
    # Pour les badges sur les titres
    @supplier_orders = Order.all.where(status: 0, client_id: nil)
    @products = Product.where(quantity_in_stock: 0).sort_by { |element| element.title }
    @missing_products = missing(@products)
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

  def missing(products)
    products.each do |product|
      if product.order_lines.count > 0
        if product.order_lines.last.order.planned_delivery_date >= Date.today
          products.delete(product)
        end
      end
    end
  end
end
