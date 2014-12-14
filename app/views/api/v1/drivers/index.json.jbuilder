json.array! @drivers do |driver|
  json.id driver.id
  json.name driver.name
  json.available driver.available
end