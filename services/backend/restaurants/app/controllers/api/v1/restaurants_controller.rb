# frozen_string_literal: true

module Api
  module V1
    # Controller that implements the restaurants related endpoints
    class RestaurantsController < ApplicationController

      # GET /api/v1/restaurants
      def index
        render json: Restaurant.search(nil)
      end

      def categories
        render json: Category.all.sample(5), status: :ok
      end
    end
  end
end
