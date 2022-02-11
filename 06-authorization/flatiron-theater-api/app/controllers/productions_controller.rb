class ProductionsController < ApplicationController
    before_action :authorize_user, only: [:create]

    def index 
        render json: Production.all
    end 

    def show
        production = Production.find(params[:id])
        render json: production
    end 

    def create
        production = Production.create!(production_params)
        byebug
        render json: production, status: :created
    rescue  ActiveRecord::RecordInvalid => invalid
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
     
    end 
    
    def destroy
        production = Production.find(params[:id])
        production.destroy
        head :no_content
    end 

    def production_params
        params.permit(:title, :genre,:description, :budget, :image, :director, :ongoing)
    end 
end
