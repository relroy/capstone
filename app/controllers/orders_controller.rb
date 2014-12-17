class OrdersController < ApplicationController
  
  def update
    @order = Order.find(params[:id])
    @drivers = Driver.all
  end
  
end

