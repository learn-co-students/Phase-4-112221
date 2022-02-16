class ProductionRolesController < ApplicationController
    #rescue_from
    #index

    def index
        production_roles = ProductionRole.all
        render json: production_roles, status: :ok
    end 

    #show
    def show
        production_role = ProductionRole.find(params[:id])
        render json: production_roles, status: :okay
    end 

    #create

    def create
    end 

    #update

    #delete 
end
