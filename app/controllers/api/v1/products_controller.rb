class Api::V1::ProductsController < ApplicationController

  def index
    # render json: Product.all 
    @products = Product.all   
  end
end
