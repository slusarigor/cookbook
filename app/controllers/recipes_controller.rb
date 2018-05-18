class RecipesController < ApplicationController
  def index
    @recipes = Recipe.find_by_products product_titles

    render partial: 'recipes/recipe'
  end

  private

  def product_titles
    params[:products] ? params[:products].split(',') : []
  end
end
