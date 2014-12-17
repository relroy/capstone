class ChargesController < ApplicationController
  def new
    
  end

def create

  # Amount in cents

  @order = Order.find_by(status: "cart", user_id: current_user.id)

  customer = Stripe::Customer.create(
    :email => current_user.email,
    :card  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => (@order.total * 100).to_i,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
  )

  @order.update(:status => "purchased", :total => @order.total)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

end
