class ProductionsController < ApplicationController
    def index 
        render json: Production.all
    end 

    def show
        production = Production.find(params[:id])
        render json: production, include: :production_roles
    end 

    #Review: Create action 
    def create
        production = Production.create!(production_params)
        render json: production, status: :created
    rescue ActiveRecord::RecordInvalid => invalid
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end 

    def update
        production = Production.find(params[:id])
        production.update!(production_params)
        render json: production, status: :created
    rescue ActiveRecord::RecordInvalid => invalid
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end 

    def destroy
        production = Production.find(params[:id])
        production.destroy
        head :no_content
    rescue ActiveRecord::RecordInvalid => invalid
        render json: { errors: invalid.record.errors }, status: :not_found  
    end 


    private

    def production_params
        params.permit(:title, :genre, :description, :budget, :image, :director, :ongoing)
    end 

    
    #Review: Strong Params 
end
