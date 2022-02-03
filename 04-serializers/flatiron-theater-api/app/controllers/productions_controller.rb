class ProductionsController < ApplicationController
    def index 
        render json: Production.all
    end 

    def show
        production = Production.find(params[:id])
        render json: production, include: :production_roles
    end 

    #Review: Create action 
    
    def destroy
        production = Production.find(params[:id])
        production.destroy
        head :no_content
    end 

    #Review: Strong Params 
end
