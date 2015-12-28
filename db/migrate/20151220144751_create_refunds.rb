class CreateRefunds < ActiveRecord::Migration
  def change
    create_table :refunds do |t|
      t.integer :transaction_id, :index => true
      t.boolean :approved, :default => false, :index => true
      t.integer :status, :index => true
      t.string :reason
      t.text :comment

      t.timestamps null: false
    end
  end
end
