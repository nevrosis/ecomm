class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :author
      t.text :description
      t.integer :price, defaut: 0
      t.boolean :availability, default: true

      t.timestamps
    end
  end
end
