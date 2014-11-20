class CartedProductsController < ApplicationController
  before_action :authenticate_user!

def create
    if Order.find_by(:status => "cart", :user_id => current_user.id)
      @order = Order.find_by(:status => "cart", :user_id => current_user.id)
    else
      @order = Order.create(:status => "cart", :user_id => current_user.id)
    end
    @carted_product = CartedProduct.create(carted_product_params.merge({:order_id => @order.id}))
    
    redirect_to @carted_product
  end
  def index

    @order = Order.find_by(:user_id => current_user.id, :status => "cart")
    
    @carted_products = @order.carted_products
    @products = Product.all
    product_id = params[:id] 
    @carted_product = CartedProduct.new  

  end
  
  def show
    @order = Order.find_by(:user_id => current_user.id, :status => "cart")
    @carted_products = @order.carted_products

    @carted_product = CartedProduct.find_by(id: params[:id])
    @available_flavors = Flavor.all
  end

  def update
    @carted_product = CartedProduct.find_by(id: params[:id])
    @carted_product.update(:flavor_id => params[:flavor_id])
    redirect_to carted_products_path
  end


  private

  def carted_product_params
    @product = params.require(:carted_product).permit(:quantity, :product_id, :container_id, :ic_flavor_id, :option_id, :size_id, :flavor_id,)  
  end





end
