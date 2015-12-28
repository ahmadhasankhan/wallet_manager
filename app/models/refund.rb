class Refund < ActiveRecord::Base
  belongs_to :m_transaction

  validates_presence_of :transaction_id, :reason
end
