class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.integer :customer_id,null: false
      t.string :address_postal_code,null: false
      t.string :address_address,null: false
      t.string :address_name,null: false
      t.timestamps
    end
  end
end
