class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.references :item_id,              foreign_key: true
      t.references :user_id,              foreign_key: true
      t.timestamps
    end
  end
end
