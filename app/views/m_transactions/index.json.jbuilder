json.array!(@m_transactions) do |m_transaction|
  json.extract! m_transaction, :id, :account_id, :reference_no, :amount, :transaction_type, :status
  json.url m_transaction_url(m_transaction, format: :json)
end
