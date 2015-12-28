require 'test_helper'

class MTransactionsControllerTest < ActionController::TestCase
  setup do
    @m_transaction = m_transactions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:m_transactions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create m_transaction" do
    assert_difference('MTransaction.count') do
      post :create, m_transaction: { account_id: @m_transaction.account_id, amount: @m_transaction.amount, reference_no: @m_transaction.reference_no, status: @m_transaction.status, transaction_type: @m_transaction.transaction_type }
    end

    assert_redirected_to m_transaction_path(assigns(:m_transaction))
  end

  test "should show m_transaction" do
    get :show, id: @m_transaction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @m_transaction
    assert_response :success
  end

  test "should update m_transaction" do
    patch :update, id: @m_transaction, m_transaction: { account_id: @m_transaction.account_id, amount: @m_transaction.amount, reference_no: @m_transaction.reference_no, status: @m_transaction.status, transaction_type: @m_transaction.transaction_type }
    assert_redirected_to m_transaction_path(assigns(:m_transaction))
  end

  test "should destroy m_transaction" do
    assert_difference('MTransaction.count', -1) do
      delete :destroy, id: @m_transaction
    end

    assert_redirected_to m_transactions_path
  end
end
