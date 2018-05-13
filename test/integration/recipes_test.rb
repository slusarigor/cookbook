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

  describe "GET /recipes" do
    before :each do
      create_list :recipe, 3


    end
    it "html" do
      get '/recipes'

      assert_response :success
      assert_html_equal 3, 'class="recipe"'
    end

    it "json" do
      get '/recipes.json'
      body = JSON.parse(response.body)

      assert_response :success
      assert_equal 3, body.count
    end
  end

  describe "GET /recipes?products=product1,product2" do
    before do
      @recipe = Recipe.create title: 'test'
      @recipe.products.create title: 'product1'
    end

    it "html" do
      get '/recipes?products=product1'

      skip 'todo'
    end
  end
end
