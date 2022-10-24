class CreateCategorizations < ActiveRecord::Migration[7.0]
  def change
    create_table :categorizations do |t|
      t.integer :product_id
      t.integer :category_id
      t.integer :position

      t.timestamps
    end
  end
end
