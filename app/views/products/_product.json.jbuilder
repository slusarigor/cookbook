json.extract! product, :id, :title, :image, :created_at, :updated_at
json.url product_url(product, format: :json)
