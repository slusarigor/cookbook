class ProductsController < ApplicationController
  def index
    unless params[:q]
      products = Product.all
    else
      products = Product.where('title LIKE ?', "%#{params[:q]}%")
    end

    render json: products
  end
end
