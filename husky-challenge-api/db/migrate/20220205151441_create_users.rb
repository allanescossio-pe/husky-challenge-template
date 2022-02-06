class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, limit: 100, null: false, index: { unique: true }
      t.string :auth_token, index: { unique: true }
      t.boolean :auth_token_has_been_validated, null: false, default: false
      t.timestamps
    end
  end
end
