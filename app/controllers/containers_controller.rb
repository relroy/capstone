# class ContainersController < ApplicationController

#   def index
#     @order = Order.find_by(:user_id => current_user.id, :status => "cart")
#     @carted_products = @order.carted_products
#     @carted_product = CartedProduct.find_by(id: params[:id])
#     product_id = params[:id]
#     @containers = Container.all
#   end

#   def show
#     @order = Order.find_by(:user_id => current_user.id, :status => "cart")
#     @carted_products = @order.carted_products
#     @carted_product = CartedProduct.find_by(id: params[:id])
#     @containers = Container.all
#   end
# end