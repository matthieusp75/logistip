class OrderLinesController < ApplicationController
  def create
    @order_line = OrderLine.new(order_line_params)
    p = @order_line.product
    @order_line.line_total_price = p.buying_price * @order_line.quantity * p.quantity_per_case
    authorize @order_line
    @supplier = @order_line.product.supplier
    @pending_orders = @supplier.orders.where(status: 0, client_id: nil)
    attribute_order(@pending_orders, @order_line)
    if @order_line.save
      flash.notice = "Commande bien enregistrée"
    else
      Order.last.delete if @pending_orders.count.zero?
      flash.alert = @order_line.errors.messages.values.join(", ")
    end
    redirect_to current_url
  end

  def update
    @order_line = OrderLine.find(params[:id])
    authorize @order_line
    @order = @order_line.order
    @order_line.update(order_line_params)
    if @order_line.save
      @order.update(total_price: @order.total_price - @order_line.line_total_price)
      @order_line.update(line_total_price: @order_line.quantity * @order_line.product.buying_price * @order_line.product.quantity_per_case)
      @order.update(total_price: @order.total_price + @order_line.line_total_price)
      @order.save
      flash.notice = "Commande bien mise à jour"
    else
      flash.alert = "Mise à jour impossible"
    end
    redirect_to order_path(@order)
  end

  private

  def order_line_params
    params.require(:order_line).permit(:quantity, :product_id)
  end

  def create_order(order_line)
    @order = Order.new
    @order.planned_delivery_date = Date.today + order_line.product.supplier.shipping_date_minimum_period + 2
    @order.total_price = order_line.line_total_price
    @order.status = 0
    @order.user = current_user
    order_line.order = @order
    @order.save
  end

  def attribute_order(orders, order_line)
    if orders.count.positive? && orders.last.planned_delivery_date > Date.today
      price = orders.last.total_price + order_line.line_total_price
      order_line.order = orders.last
      orders.last.update(total_price: price) if order_line.save
    else
      create_order(order_line)
    end
  end

  def current_url
    session[:return_to] = request.referer
  end
end
