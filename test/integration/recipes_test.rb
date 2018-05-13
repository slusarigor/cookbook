require "test_helper"

# To be handled correctly this spec must end with "Integration Test"
describe "Recipes Integration Test" do
  it "GET /recipes" do
    get '/recipes'

    assert_response :success
  end
end
