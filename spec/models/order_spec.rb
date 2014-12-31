require 'rails_helper'

describe Order do
  describe 'sub_total' do
    it 'should return the sub_total of all the carted products prices times the quantity of each' do
      product = Product.create!(:price => 3.0, :name => "cone")
      product_2 = Product.create!(:price => 5.0, :name => "shake")
      order = Order.create #do I need (:user_id => 2, :status => 'cart')? I tried this but didn't work.
      carted_product_1 = CartedProduct.create!(:product_id => product.id, :quantity => 3, :order_id => order.id)
      carted_product_2 = CartedProduct.create!(:product_id => product.id, :quantity => 2, :order_id => order.id)

      expect(order.sub_total).to eq(19.0)
    end
  end
end