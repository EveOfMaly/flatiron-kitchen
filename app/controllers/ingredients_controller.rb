class IngredientsController < ApplicationController

    def index
        @ingredients = Ingredient.all
    end

    def new 
        @ingredient = Ingredient.new
    end

    def create
        @ingredient = Ingredient.new(params_ingredient)

        if @ingredient.save 
            redirect_to ingredient_path(@ingredient)
        else
            render :new
        end
    end

    def show 
        @ingredient = Ingredient.find(params[:id])
    end


    def edit 
        @ingredient = Ingredient.find(params[:id])
    end

    def update 
        @ingredient = Ingredient.find(params[:id])
        @ingredient.update(params_ingredient)
        redirect_to ingredient_path(@ingredient)
    end


    def params_ingredient
        params.require(:ingredient).permit(:name)
    end


end
