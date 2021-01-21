# frozen_string_literal: true

module Api
  module V1
    # Controller that implements the restaurants related endpoints
    class RestaurantsController < ApplicationController

      # GET /api/v1/restaurants
      def index
        render json: Restaurant.search(restaurants_params)
      end

      def categories
        render json: Category.all.sample(5), status: :ok
      end

      private

      def restaurants_params
        params.permit(:term, :location, :radius)
      end
    end
  end
end
