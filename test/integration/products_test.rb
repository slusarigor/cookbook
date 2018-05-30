require 'test_helper'

describe 'Products Integration Test' do
  before :each do
    DatabaseCleaner.start
  end

  after :each do
    DatabaseCleaner.clean
  end

  it '/products' do
    create(:recipe, :with_products, titles: %w[egg milk])
    get '/products'
    body = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, body.length
  end
end
