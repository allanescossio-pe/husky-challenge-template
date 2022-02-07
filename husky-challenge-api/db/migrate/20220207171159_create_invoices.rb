class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :number, null: false, unique: true
      t.string :issuer, null: false, limit: 150
      t.string :payer, null: false, limit: 150
      t.float :price, null: false
      t.date :due_date, null: false
      t.timestamp :created_at, null: false
    end
  end
end
