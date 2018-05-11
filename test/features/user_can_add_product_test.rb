require "../test_helper"

feature "UserCanAddProduct" do
  scenario "displays input to enter product" do
    visit root_path
    page.must_have_content "What products do you have?"
    page.find('input.product_title')
  end

  scenario "when user enters product then additional input appears" do
    visit root_path

    page.find('input.product_title')
  end
end
