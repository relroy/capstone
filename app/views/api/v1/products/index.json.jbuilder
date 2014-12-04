json.array! @products do |product|
  json.id product.id
  json.name product.name
  json.price product.price.to_f.round(2)
  json.photo product.photo
end

# json.ice_creams do
#   json.array! @ice_creams do |ic_flavor|
#     json.name ic_flavor.name
#   end
# end