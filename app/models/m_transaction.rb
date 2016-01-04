class MTransaction < ActiveRecord::Base
  belongs_to :account
  has_many :refunds

  validates_presence_of :reference_no, :amount, :transaction_type
  validates_numericality_of :amount, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 10000
  after_initialize :init_transaction


  def validate_callback_transaction_details(callback_params)
    response = true
    if callback_params["amount"].to_f == self.amount.to_f && callback_params['ref_id'] == self.reference_no
      self.transaction_mode = callback_params['txn_mode']
      self.status= 4
      self.details= "Transaction was successful"
    else
      self.status= 5
      self.transaction_mode = callback_params['txn_mode']
      self.details= "Data was tampered"
      response = false
    end

    if self.save
      self.account.update_balance(self.amount)
    else
      response = false
    end
    response
  end

  private

  def init_transaction
    if new_record?
      self.status = "initiated"
      self.reference_no=generate_reference_no
    end
  end

  def generate_reference_no
    rand((Time.now.to_f*100.0).to_i).to_s[2..10]
  end
end
