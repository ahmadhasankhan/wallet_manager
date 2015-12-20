json.array!(@users) do |user|
  json.extract! user, :id, :email, :crypted_password, :password_salt, :persistence_token, :authentication_token, :perishable_token, :single_access_token, :login_count, :failed_login_count, :last_request_at, :current_login_at, :last_login_at, :current_login_ip, :last_login_ip, :active, :confirmed
  json.url user_url(user, format: :json)
end
