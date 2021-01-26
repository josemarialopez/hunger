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
        render json: Category.all, status: :ok
      end

      def main_categories
        render json: Category.main, status: :ok
      end

      private

      def restaurants_params
        params.permit(:term, :location, :radius, :categories)
      end
    end
  end
end
