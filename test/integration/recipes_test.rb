require 'test_helper'

# To be handled correctly this spec must end with 'Integration Test'
describe 'Recipes Integration Test' do
  include CustomAssertions

  before :each do
    DatabaseCleaner.start
    @recipe_selector = 'class="recipe'
  end

  after :each do
    DatabaseCleaner.clean
  end

  describe 'GET /recipes?products=product1,product2' do
    before :each do
      create(:recipe, :with_products, titles: %w[banana egg milk])
      create(:recipe, :with_products, titles: %w[banana egg])
      create(:recipe, :with_products, titles: %w[potato milk])
    end

    it 'gets recipeA and recipeB' do
      get '/recipes?products=banana,egg'

      assert_response :success
      assert_html_equal 2, @recipe_selector
    end
    it 'gets recipeC' do
      get '/recipes?products=potato'

      assert_response :success
      assert_html_equal 1, @recipe_selector
    end
  end
end
