class ProductsController < ApplicationController
before_action :authenticate_user!, :only => [:index]
before_action :authenticate_admin!, :only => [:edit, :destroy]

  def index
    @products = Product.all
    product_id = params[:id] 
    @carted_product = CartedProduct.new  
    # @carted_products = CartedProduct.all
    @order = Order.find_by(:user_id => current_user.id, :status => "cart") || current_user.orders.create(:status => "cart") 
    @carted_products = @order.carted_products
    
  end


  def show
    product_id = params[:id]
    @products = Product.all
    @product = Product.find(product_id)
    @carted_product = CartedProduct.new
  end

  def checkout
    @products = Product.first
  end
  
  def lookup_result
    @name = params[:name]   
    @products = Product.all
  end

  def search
    @name = params[:name]    
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
     flash[:success] = "Product Added"
     redirect_to product_path(@product.id)
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find_by(:id => params[:id])  
    
  end

  def update
    @product = Product.find_by(:id => params[:id])
    @product.update(product_params)
    flash[:success] = "Product successfully updated!"
    redirect_to "/products/#{params[:id]}"   
  end

  def destroy
    @product = Product.find_by(:id => params[:id])
    @product.destroy
    flash[:success] = "Product Deleted"
    redirect_to '/products'    
  end

  def learn_more    
  end

  private 

  def product_params
    @product = params.require(:product).permit(:name, :photo, :price)  
  end
end