class TicketsController < ApplicationController
    #Review: Index Action
    def index
        render json: Ticket.all, status: :ok
    end 

    #Review: Show Action

    def show
        ticket = Ticket.find(params[:id])
        render json: ticket, status: :ok
    rescue ActiveRecord::RecordInvalid => invalid
        render json: { errors: invalid.record.errors }, status: :not_found  
    end 

    #Review: Create action 
    def create 
        ticket = Ticket.create(ticket_params)
        render json: ticket, status: :created
    rescue ActiveRecord::RecordInvalid => invalid
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end 
    
    #Review: Strong Params 
    private

    def ticket_params
        params.permit(:price, :user_id, :production_id)
    end 
    
end
