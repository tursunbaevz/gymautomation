json.extract! payment, :id, :price, :payment_date, :created_at, :updated_at
json.url payment_url(payment, format: :json)
