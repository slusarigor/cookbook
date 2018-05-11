require "test_helper"

feature "UserCanAddProduct" do
  before do
    @input_selector = 'input.product_title'
  end
  scenario "displays text and input to enter product" do
    visit root_path
    page.must_have_content "What products do you have?"
    page.find(@input_selector)
  end

  scenario "when user enters less than 2 characters then nothing happened", js: true do
    visit root_path
    input = page.find(@input_selector)

    assert_equal 1, page.all(@input_selector).count
    input.set('m').trigger('blur')
    assert_equal 1, page.all(@input_selector).count
  end

  scenario "when user enters enough characters then additional input appears", js: true do
    visit root_path
    input = page.find(@input_selector)

    assert_equal 1, page.all(@input_selector).count
    input.set('milk').trigger('blur')
    assert_equal 2, page.all(@input_selector).count
  end

  scenario "when user start typing product then suggestions appear to pick one", js: true do
    visit root_path
    input = page.find(@input_selector)
    input.set('eg').trigger('keyup')
    page.find('.product-autocomplete')
  end
end
