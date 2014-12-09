json.array! @flavors do |flavor|
  json.id flavor.id
  json.name flavor.name
  json.price flavor.price
end