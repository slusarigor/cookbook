class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.string :image

      t.timestamps
    end

    add_index :recipes, :title
  end
end
