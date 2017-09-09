module Api
  class BaseController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :not_found


    private
    def not_found
      render json: {error: 'resource not found'}, status: 404
    end
  end
end
