json.extract! user, :id, :uid, :email, :name, :image_url, :first_name, :last_name, :level, :created_at, :updated_at
json.url user_url(user, format: :json)
