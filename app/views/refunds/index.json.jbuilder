json.array!(@refunds) do |refund|
  json.extract! refund, :id, :transaction_id, :approved, :status, :reason, :comment
  json.url refund_url(refund, format: :json)
end
