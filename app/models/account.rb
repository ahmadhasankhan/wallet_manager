class Account < ActiveRecord::Base
  belongs_to :user
  has_many :m_transactions

  validates_presence_of :monthly_limit
end
