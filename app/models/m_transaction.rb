class MTransaction < ActiveRecord::Base
  belongs_to :account
  has_many :refunds

  validates_presence_of :reference_no, :amount, :transaction_type
  validates_numericality_of :amount, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 10000
  after_initialize :init_transaction

  private

  def init_transaction
    if new_record?
      self.status = "initiated"
      generate_reference_no
    end
  end

  def generate_reference_no
    self.reference_no = "PUC12123123123"
  end
end
