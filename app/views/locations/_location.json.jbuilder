json.extract! location, :id, :street, :suite, :city, :state, :zip_code, :created_at, :updated_at
json.url location_url(location, format: :json)