class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :cost
      t.string :description
      t.integer :rating
      t.timestamps
    end
  end
end
