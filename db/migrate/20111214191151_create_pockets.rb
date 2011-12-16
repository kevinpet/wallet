class CreatePockets < ActiveRecord::Migration
  def self.up
    create_table :pockets do |t|
      t.integer :user_id
      t.integer :wallet_id
      t.string :access
      t.timestamps
    end
  end

  def self.down
    drop_table :pockets
  end
end
