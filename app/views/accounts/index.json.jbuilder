json.array!(@accounts) do |account|
  json.extract! account, :id, :balance, :monthly_limit, :limit, :active
  json.url account_url(account, format: :json)
end
