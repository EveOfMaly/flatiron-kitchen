class RecipesController < ApplicationController
    def index
        @recipes = Recipe.all
    end

    def new 
        @recipe = Recipe.new
    end

    def create

        @recipe = Recipe.new(params_recipe)

        if @recipe.save 
            redirect_to recipe_path(@recipe)
        else
            render :new
        end
    end

    def show 
        @recipe = Recipe.find(params[:id])
    end


    def edit 
        @recipe = Recipe.find(params[:id])
    end

    def update 
        @recipe = Recipe.find(params[:id])
        @recipe.update(params_recipe)
        redirect_to recipe_path(@recipe)

    end

    def params_recipe
        params.require(:recipe).permit(:name, ingredient_ids: [])
    end
end
