require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  setup do
    DatabaseCleaner.start
  end

  teardown do
    DatabaseCleaner.clean
  end

  test "creates factory :recipe" do
    assert_difference 'Recipe.count', 1 do
      create :recipe
    end
  end

  test "creates factory :recipe with products" do
    assert_difference 'Product.count', 2 do
      create(:recipe, :with_products, titles: [:egg, :milk])
    end
  end

  test "finds 1 recipe by 1 product" do
    recipeA = create(:recipe, :with_products, titles: [:egg, :milk])
    recipeB = create(:recipe, :with_products, titles: [:banana, :egg])
    recipeC = create(:recipe, :with_products, titles: [:potato, :salt])

    assert_equal [recipeC], Recipe.find_by_products(:potato)
  end

  test "finds 2 recipes by 1 product" do
    recipeA = create(:recipe, :with_products, titles: [:egg, :milk])
    recipeB = create(:recipe, :with_products, titles: [:banana, :egg])
    recipeC = create(:recipe, :with_products, titles: [:potato, :salt])

    assert_equal [recipeA, recipeB], Recipe.find_by_products(:egg)
  end

  test "finds 2 recipes by 2 product" do
    recipeA = create(:recipe, :with_products, titles: [:egg, :milk])
    recipeB = create(:recipe, :with_products, titles: [:banana, :egg])
    recipeC = create(:recipe, :with_products, titles: [:potato, :salt])

    assert_equal [recipeA, recipeB], Recipe.find_by_products('egg', 'banana')
  end
end
