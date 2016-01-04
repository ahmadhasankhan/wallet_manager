class Account < ActiveRecord::Base
  belongs_to :user
  has_many :m_transactions

  validates_presence_of :monthly_limit


  def update_balance(amount)
    new_balance = self.balance+amount
    self.update_attribute('balance', new_balance)
  end
end
