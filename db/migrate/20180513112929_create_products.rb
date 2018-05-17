class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :title
      t.string :image

      t.timestamps
    end

    add_index :products, :title, unique: true
  end
end
