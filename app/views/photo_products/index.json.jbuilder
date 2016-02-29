json.array!(@photo_products) do |photo_product|
  json.extract! photo_product, :id, :title, :comment
  json.url photo_product_url(photo_product, format: :json)
end
