class CreateProducts < ActiveRecord::Migration
  
  def self.up
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.datetime :released_at
      t.timestamps
    end
    add_index :products, :released_at
  end
  
  def self.down
    remove_index :products, :released_at
    drop_table :products
  end
end
