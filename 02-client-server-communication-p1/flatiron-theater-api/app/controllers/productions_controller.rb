class ProductionsController < ApplicationController
    def index 
        render json: Production.all
    end 

    def show
        production = Production.find(params[:id])
        render json: production, include: :production_roles
    end 

    def create
        production = Production.create!(production_params)
        render json: production, status: :created
    rescue ActiveRecord::RecordInvalid => invalid
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end 
end
