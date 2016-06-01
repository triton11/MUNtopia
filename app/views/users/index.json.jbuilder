json.array!(@users) do |user|
  json.extract! user, :id, :name, :password_hash, :country, :email
  json.url user_url(user, format: :json)
end
