class CreateCartaItems < ActiveRecord::Migration[6.1]
  def change
    create_table :carta_items do |t|
      t.integer :item_id
      t.integer :customer_id
      t.integer :amount

      t.timestamps
    end
  end
end
