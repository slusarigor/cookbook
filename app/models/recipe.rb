class Recipe < ApplicationRecord
  has_and_belongs_to_many :products

  def self.find_by_products(titles)
    distinct.joins(:products).where('products.title' => titles)
  end
end
