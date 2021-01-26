# frozen_string_literal: true

require 'singleton'

module Yelp
  # Custom errors
  class RestaurantNotFoundError < StandardError; end
  class UnprocessableRestaurantSearchError < StandardError; end

  # Manager to communicate with the Yelp API
  class Manager
    include Singleton

    # Constants
    API_HOST = 'https://api.yelp.com'
    API_VERSION = 'v3'
    API_URL = "#{API_HOST}/#{API_VERSION}"
    DEFAULT_LIMIT = 5 # Maximum number of elements
    DEFAULT_OFFSET = 0
    DEFAULT_SORT_BY = 'best_match'
    SORT_FIELDS = %w[best_match rating review_count distance].freeze
    QUERY_PARAM_KEYS = %w[term location limit latitude longitude radius categories offset sort_by price].freeze

    def initialize
      @connection =
        Faraday.new(
          url: API_URL,
          headers: { 'Authorization': "Bearer #{Rails.application.credentials.yelp[:api_key]}" }
        )
    end

    def find_restaurant(id)
      response = @connection.get("businesses/#{id}")
      raise RestaurantNotFoundError unless response.success?

      parse_response(response)
    end

    def search_restaurants(params = {})
      response = @connection.get('businesses/search', query_params(params))
      raise Yelp::UnprocessableRestaurantSearchError unless response.success?

      parse_response(response)
    end

    private

    def query_params(params)
      params = params.slice(*QUERY_PARAM_KEYS)
      params = force_restaurant_category(params)
      params = format_categories_param(params)
      params = format_price_param(params) if params[:price]
      params = force_limit_param(params)
      params = force_offset_param(params)
      force_sort_by_param(params)
    end

    def force_sort_by_param(params)
      params["sort_by"] ||= DEFAULT_SORT_BY
      params
    end

    def force_offset_param(params)
      params["offset"] ||= DEFAULT_OFFSET
      params
    end

    def force_limit_param(params)
      params["limit"] ||= DEFAULT_LIMIT
      params
    end

    def force_restaurant_category(params)
      params["categories"] = Array(params["categories"]).push('restaurants')
      params
    end

    def format_categories_param(params)
      params["categories"] = Array(params["categories"]).uniq.join(',')
      params
    end

    def format_price_param(params)
      params["price"] = Array(params["price"]).uniq.join(',')
      params
    end

    def parse_response(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
