class HomeController < ApplicationController
  def index
  end

  def bank
    respond_to do |format|
      format.html { redirect_to action: 'confirmation_callback', controller: 'm_transactions', :ref_id => params[:ref_id], :txn_mode =>"CD", :amount => params[:amount], :bank_transaction_id => rand(1000) }
      #format.json { render :show, status: :ok, location: @m_transaction }
    end
  end

  def payment

  end

end
