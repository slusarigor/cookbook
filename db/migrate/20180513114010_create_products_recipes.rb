class CreateProductsRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :products_recipes do |t|
      t.belongs_to :recipe, index: true
      t.belongs_to :product, index: true
    end
  end
end
