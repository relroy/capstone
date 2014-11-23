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
    id = @carted_product.product.category_id
    if id == 1
      @available_flavors = SyrupFlavor.all
    elsif id == 2
      @available_flavors = SmoothieFlavor.all
    elsif id == 3
      @available_flavors = FrozenLatteFlavor.all
    elsif id == 4
      @available_flavors = FrostbiteFlavor.all
    elsif id == 5
      @available_flavors = IcFlavor.all
    elsif
      id == 7
      @available_flavors = SyrupFlavor.all
    else
      #@available_flavors = []
      redirect_to carted_products_path
    end

    
    # @available_frostbite_flavors = FrostbiteFlavor.all
    # @available_shake_flavors = SyrupFlavor.all
  end

  def update

    @carted_product = CartedProduct.find_by(id: params[:id])
    id = @carted_product.product.category_id
    puts "ID:"
    puts id.class
    if id == 1
      @carted_product.update(:syrup_flavor_id => params[:flavor_id])
    elsif id == 2
      @carted_product.update(:smoothie_flavor_id => params[:flavor_id])
    elsif id == 3
      @carted_product.update(:frozen_latte_flavor_id => params[:flavor_id])
    elsif id == 4
      @carted_product.update(:frostbite_flavor_id => params[:flavor_id])
    elsif id == 5
      @carted_product.update(:ic_flavor_id => params[:flavor_id])
    elsif id == 7
      @carted_product.update(:syrup_flavor_id => params[:flavor_id])
    end
    
    # @carted_product.update(:flavor_id => params[:flavor_id])
    redirect_to carted_products_path
  end


  private

  def carted_product_params
    @product = params.require(:carted_product).permit(:quantity, :product_id, :container_id, :ic_flavor_id, :option_id, :size_id, :flavor_id, :syrup_flavor_id, :frostbite_flavor_id, :frozen_latte_flavor_id, :smoothie_flavor_id)  
  end





end
