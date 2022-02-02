class ProductionsController < ApplicationController
    def index 
        render json: Production.all
    end 

    def show
        production = Production.find(params[:id])
        render json: production, include: :production_roles
    end 

    #Review: Create action 
    
    #Review: Strong Params 
end
