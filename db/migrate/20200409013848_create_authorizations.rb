class CreateAuthorizations < ActiveRecord::Migration[6.0]
  def change
    create_table :authorizations do |t|
      t.integer :invoice_id
      t.string :secret_key

      t.timestamps
    end
  end
end
