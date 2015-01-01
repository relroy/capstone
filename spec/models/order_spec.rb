require 'rails_helper'

describe Order do
  describe 'sub_total' do
    it 'should return the sub_total of all the carted products prices times the quantity of each' do
      product = Product.create!(:price => 3.0, :name => "cone")
      product_2 = Product.create!(:price => 5.0, :name => "shake")
      order = Order.create!(:user_id => 2, :status => 'cart')
      carted_product_1 = CartedProduct.create!(:product_id => product.id, :quantity => 3, :order_id => order.id)
      carted_product_2 = CartedProduct.create!(:product_id => product_2.id, :quantity => 2, :order_id => order.id)

      expect(order.sub_total).to eq(19.0)
    end
  end
end

describe Order do
  describe 'sales_tax' do 
    it 'should tell you the sales tax of all carted products times the quantity' do
      product = Product.create!(:price => 5.0, :name => 'shake')
      product_2 = Product.create!(:price => 3.0, :name => "cone")
      order = Order.create!(:user_id => 2, :status => 'cart')
      carted_product = CartedProduct.create!(:product_id => product.id, :quantity => 3, :order_id => order.id)
      carted_product_2 = CartedProduct.create!(:product_id => product_2.id, :quantity => 2, :order_id => order.id)

      expect(order.sales_tax).to eq(1.31)
    end
  end
end