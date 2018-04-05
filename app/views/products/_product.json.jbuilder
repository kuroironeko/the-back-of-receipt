json.extract! product, :id, :name, :number, :user_id, :created_at, :updated_at
json.url product_url(product, format: :json)
