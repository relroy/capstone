json.array! @carted_products do |carted_product|
  json.name carted_product.product.name
  json.price carted_product.product.price.to_f.round(2)
  json.quantity carted_product.quantity
  if carted_product.syrup_flavor
    json.flavor carted_product.syrup_flavor.name
  end
  json.photo carted_product.product.photo
end
