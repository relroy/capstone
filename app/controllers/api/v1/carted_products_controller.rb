class Api::V1::CartedProductsController < ApplicationController

  def index
    @order = Order.find_by(status: "cart", user_id: current_user.id)
    if @order
      @carted_products = @order.carted_products
    else
      @carted_products = []
    end
  end

  def create
    @order = Order.find_by(status: "cart", user_id: params[:carted_product][:current_user_id])
    @carted_product = CartedProduct.new(carted_product_params.merge({ quantity: 1, order_id: @order.id }))
    @carted_product.save
  end

  private

  def carted_product_params
    params.require(:carted_product).permit(:product_id)
  end
end
