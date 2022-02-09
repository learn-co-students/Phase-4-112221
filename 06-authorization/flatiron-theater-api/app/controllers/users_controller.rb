class UsersController < ApplicationController
    def index
        render json: User.all
    end 
    def show
        #Show current user
    end 

    def create
        user = User.create!(user_params)
        session[:current_user] = user.id
        render json: user, status: :created
    rescue ActiveRecord::RecordInvalid => invalid
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end 

   

    private 

    def user_params
        params.permit(:name, :email)
    end 

end
