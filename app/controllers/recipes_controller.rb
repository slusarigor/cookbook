class RecipesController < ApplicationController
  # GET /recipes
  def index
    @recipes = Recipe.find_by_products product_titles

    render template: 'recipes/_recipe', layout: false
  end

  private

  def product_titles
    params[:products] ? params[:products].split(',') : []
  end
end
