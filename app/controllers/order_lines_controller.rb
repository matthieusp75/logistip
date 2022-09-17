class OrderLinesController < ApplicationController
  def create
    @order_line = OrderLine.new(order_line_params)
    @order_line.line_total_price = @order_line.product.buying_price * @order_line.quantity
    # Pseudo coder: recherche du bon order
    authorize @order_line
    # Chercher le fournisseur du produit
    @supplier = @order_line.supplier

    # Chercher les commandes du fournisseur qui sont pending
    @pending_orders = @supplier.orders.where("status = ? AND client_id = ? ", 0, nil)

    # Il nous reste un hash d'un seul element : l'order de status 0 correspondant à ce fournisseur
      # ou un array vide si cet order n'existe pas

    # Si il n'existe pas, créer un order avec le bon supplier
    if @pending_orders.length == 0
      @order = Order.new
      @order.planned_delivery_date = Date.today + @order_line.product.supplier.shipping_date_minimum_period
      @order.total_price = @order_line.quantity * @order_line.product.buying_price
      @order.status = 0
      @order.user = current_user

    # Si il existe, alors on choisit cet order
    else
      @order = @pending_orders.first
    end

    # Attribuer l'orderline à cet order
    @order_line.order = @order

    # Redirection à modifier lorsque nous aurons plus de pages
    if @order_line.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def update
    @order_line = OrderLine.find(params[:id])
    authorize @order_line
    @order = @order_line.order
    @order_line.update(order_line_params)
    redirect_to order_path(@order)
  end

  private

  def order_line_params
    params.require(:order_line).permit(:quantity, :line_total_price, :order_id, :product_id)
  end
end
