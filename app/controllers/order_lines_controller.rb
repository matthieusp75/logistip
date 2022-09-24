class OrderLinesController < ApplicationController
  def create
    @order_line = OrderLine.new(order_line_params)
    @order_line.line_total_price = @order_line.product.buying_price * @order_line.quantity
    authorize @order_line
    # Chercher le fournisseur du produit
    @supplier = @order_line.product.supplier
    # Chercher les commandes du fournisseur qui sont pending
    @pending_orders = @supplier.orders.where(status: 0, client_id: nil)
    # Si il n'existe pas, créer un order avec le bon supplier
    if @pending_orders.length.zero?
      @order = Order.new
      @order.planned_delivery_date = Date.today + @order_line.product.supplier.shipping_date_minimum_period + 2
      @order.total_price = @order_line.quantity * @order_line.product.buying_price
      @order.status = 0
      @order.user = current_user
    # Si il existe, alors on choisit cet order
    else
      @order = @pending_orders.first
      @order.total_price += @order_line.line_total_price
      @order.save
    end
    # Attribuer l'orderline à cet order
    @order_line.order = @order

    # Redirection à modifier lorsque nous aurons plus de pages
    if @order_line.save
      redirect_to dashboard_path
    else
      redirect_to root_path
    end
  end

  def update
    @order_line = OrderLine.find(params[:id])
    authorize @order_line
    @order = @order_line.order
    @order_line.update(order_line_params)
    @order.total_price -= @order_line.line_total_price
    @order_line.line_total_price = @order_line.quantity * @order_line.product.buying_price
    @order.total_price += @order_line.line_total_price
    @order.save
    @order_line.save
    redirect_to order_path(@order)
  end

  private

  def order_line_params
    params.require(:order_line).permit(:quantity, :line_total_price, :order_id, :product_id)
  end
end
