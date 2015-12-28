class MTransactionsController < ApplicationController
  before_action :set_m_transaction, only: [:show, :edit, :update, :destroy]

  # GET /m_transactions
  # GET /m_transactions.json
  def index
    @m_transactions = MTransaction.all
  end

  # GET /m_transactions/1
  # GET /m_transactions/1.json
  def show
  end

  # GET /m_transactions/new
  def new
    @m_transaction = MTransaction.new
    @m_transaction.account = current_user.account
    @m_transaction.transaction_type = params[:type]
    @m_transaction.save
  end

  # GET /m_transactions/1/edit
  def edit
  end

  # POST /m_transactions
  # POST /m_transactions.json
  # Init State
  def create
    @m_transaction = MTransaction.new(m_transaction_params)
    @m_transaction.account = current_user.account
    respond_to do |format|
      if @m_transaction.save
        format.html { redirect_to :controller => "m_transactions", :action => "process_transaction", :ref_id => @m_transaction.reference_no }
        format.json { render :show, status: :created, location: @m_transaction }
      else
        format.html { render :new }
        format.json { render json: @m_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /m_transactions/1
  # PATCH/PUT /m_transactions/1.json
  def update
    respond_to do |format|
      if @m_transaction.update(m_transaction_params)
        format.html { redirect_to process }
        format.json { render :show, status: :ok, location: @m_transaction }
      else
        format.html { render :edit }
        format.json { render json: @m_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  def process_transaction
    @transaction = MTransaction.find_by_reference_no(params[:ref_id])
    if @transaction
      @transaction.update_attribute('status', 1)
    else
      redirect_to root_path, notice: 'Transaction was aborted.'
    end
  end

  def confirmation_callback
    p params
    @transaction = MTransaction.find_by_reference_no(params[:ref_id])
    if @transaction
      @transaction.update_attribute('status', 4)
      redirect_to account_path, notice: 'Transaction was successful.'
    else
      redirect_to root_path, alert: 'Transaction Was Failed.'
    end
  end

  def failure_callback
    @transaction = MTransaction.find_by_reference_no(params[:ref_id])
    if @transaction
      @transaction.update_attribute('status', 5)
    else
      redirect_to root_path, notice: 'Looks like transaction was cancelled.'
    end
  end

  # DELETE /m_transactions/1
  # DELETE /m_transactions/1.json
  def destroy
    @m_transaction.destroy
    respond_to do |format|
      format.html { redirect_to m_transactions_url, notice: 'M transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_m_transaction
    @m_transaction = MTransaction.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def m_transaction_params
    params.require(:m_transaction).permit(:reference_no, :amount, :transaction_type, :type)
  end
end
