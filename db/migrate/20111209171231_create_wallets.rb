class CreateWallets < ActiveRecord::Migration
  def change
    create_table :wallets do |t|
      t.string :name
      t.string :salt
      t.string :crypto
      t.text :ctext

      t.timestamps
    end
  end
end
