class RecipesController < ApplicationController
  def index
    @recipes = Recipe.find_by_products product_titles

    render json: @recipes
  end

  private

  def product_titles
    params[:products] ? params[:products].split(',') : []
  end
end
