class CreateMTransactions < ActiveRecord::Migration
  def change
    create_table :m_transactions do |t|
      t.integer :account_id, :index => true
      t.string :reference_no, :index => true
      t.decimal :amount
      t.string :transaction_type
      t.string :transaction_mode
      t.integer :status
      t.text :details

      t.timestamps null: false
    end
  end
end
