class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    private
    def render_not_found(e)
        byebug
        render json: {error: "#{e.model}NOT FOUND :("}, status: :not_found
    end 
end
