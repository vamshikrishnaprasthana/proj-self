class CreateOrderedItems < ActiveRecord::Migration[6.0]
  def change
    create_table :ordered_items do |t|
      t.integer :quantity
      t.integer :total
      t.integer :unit_price

      t.timestamps
    end
  end
end
