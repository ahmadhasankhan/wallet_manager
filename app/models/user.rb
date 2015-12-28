class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.validate_login_field = true
    c.login_field = :email
  end
  @is_new = false

  has_one :account
  validates_presence_of :mobile, :email
  validates_uniqueness_of :mobile, :email
  validates_format_of :mobile, :with => /\A(^[789]\d{9}$)/i, :message => "Seems not a valid phone number"

  before_save :check_if_new_record
  after_save :create_account
  # Since not sending confirmation mail
  after_initialize :confirm_user

  private

  # TODO: Remove once email confirmation inplace
  def confirm_user
    self.confirmed = true
  end

  # Check if record is new or Updating existing one
  def check_if_new_record
    if new_record?
      @is_new = true
    end
  end

  # Create a new account for every new user
  def create_account
    if @is_new
      account = Account.new
      account.user = self
      account.balance = 0
      # TODO: Read the monthly_limit form config or DB
      account.monthly_limit = 10000
      account.active = true
      account.save
    end
  end
end
