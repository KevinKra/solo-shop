class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :image
      t.integer :inventory
      t.boolean :active, default: true
      t.integer :gender, default: 0

      t.timestamps
    end
  end
end
