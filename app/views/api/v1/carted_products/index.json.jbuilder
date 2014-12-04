json.array! @carted_products do |carted_product|
  json.name carted_product.product.name
  json.price carted_product.product.price.to_f.round(2)
  json.quantity carted_product.quantity
end
