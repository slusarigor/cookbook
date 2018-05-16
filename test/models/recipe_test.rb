require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  setup do
    DatabaseCleaner.start
  end

  teardown do
    DatabaseCleaner.clean
  end

  test 'creates factory :recipe' do
    assert_difference 'Recipe.count', 1 do
      create :recipe
    end
  end

  test 'creates factory :recipe with products' do
    assert_difference 'Product.count', 2 do
      create(:recipe, :with_products, titles: %w[egg milk])
    end
  end

  test 'finds 1 recipe by 1 product' do
    recipe_third = create(:recipe, :with_products, titles: %w[potato salt])
    create(:recipe, :with_products, titles: %w[egg milk])
    create(:recipe, :with_products, titles: %w[banana egg])

    assert_equal [recipe_third], Recipe.find_by_products(:potato)
  end

  test 'finds 2 recipes by 1 product' do
    recipe_first = create(:recipe, :with_products, titles: %w[egg milk])
    recipe_second = create(:recipe, :with_products, titles: %w[banana egg])
    create(:recipe, :with_products, titles: %w[potato salt])

    assert_equal [recipe_first, recipe_second], Recipe.find_by_products(:egg)
  end

  test 'finds 2 recipes by 2 product' do
    recipe_first = create(:recipe, :with_products, titles: %w[egg milk])
    recipe_second = create(:recipe, :with_products, titles: %w[banana egg])
    create(:recipe, :with_products, titles: %w[potato salt])

    assert_equal [recipe_first, recipe_second], Recipe.find_by_products('egg', 'banana')
  end
end
