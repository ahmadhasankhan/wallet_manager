class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :user_id, :index => true
      t.decimal :balance, :precision => 15, :scale => 4, default: 0, null: false
      t.decimal :monthly_limit, :precision => 15, :scale => 4, default: 0, null: false
      t.decimal :limit, :precision => 15, :scale => 4, default: 0, null: false
      t.boolean :active, default: true, :index => true

      t.timestamps null: false
    end
  end
end
