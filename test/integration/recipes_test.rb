require "test_helper"

# To be handled correctly this spec must end with "Integration Test"
describe "Recipes Integration Test" do
  include CustomAssertions

  before :each do
    DatabaseCleaner.start
  end

  after :each do
    DatabaseCleaner.clean
  end

  it "GET /recipes" do
    create_list :recipe, 3
    get '/recipes'

    assert_response :success
    assert_html_equal 3, 'class="recipe"'
  end

  describe "GET /recipes?products=product1,product2" do
    before :each do
      recipeA = create(:recipe, :with_products, titles: [:banana, :egg, :milk])
      recipeB = create(:recipe, :with_products, titles: [:banana, :egg])
      recipeC = create(:recipe, :with_products, titles: [:potato, :milk])
    end

    it "gets recipeA and recipeB" do
      get '/recipes?products=banana,egg'

      assert_response :success
      assert_html_equal 2, 'class="recipe"'
    end
    it "gets recipeC" do
      get '/recipes?products=potato'

      assert_response :success
      assert_html_equal 1, 'class="recipe"'
    end
  end
end
