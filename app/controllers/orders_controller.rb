class OrdersController < ApplicationController
  
def update
    #process credit card here!

    @order = Order.find(params[:id])
    @order.update(:status => "purchased", :total => @order.sub_total)
  end
end

