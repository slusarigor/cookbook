class HomeController < ApplicationController
  def index
    @product_list = Product.pluck(:title)
  end
end
