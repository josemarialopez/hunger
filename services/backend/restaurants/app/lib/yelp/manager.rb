# frozen_string_literal: true

require 'singleton'

module Yelp
  # Custom errors
  class RestaurantNotFoundError < StandardError; end

  # Manager to communicate with the Yelp API
  class Manager
    include Singleton

    # Constants
    API_HOST = 'https://api.yelp.com'
    API_VERSION = 'v3'
    API_URL = "#{API_HOST}/#{API_VERSION}"
    DEFAULT_LIMIT = 50 # Maximum number of elements
    DEFAULT_OFFSET = 0
    DEFAULT_SORT_BY = :best_match
    SORT_FIELDS = %i[best_match rating review_count distance]
    QUERY_PARAM_KEYS = %i[term location limit latitude longitude radius categories offset sort_by price]
    FIND_RESPONSE_EXAMPLE = { id: 'rQSFuKAyrkZtRRdOnJglJQ', alias: 'el-sur-madrid', name: 'El Sur',
                              image_url: 'https://s3-media4.fl.yelpcdn.com/bphoto/d0VliNHmKppFLz8lwHEnqg/o.jpg', is_claimed: true, is_closed: false, url: 'https://www.yelp.com/biz/el-sur-madrid?adjust_creative=tV7D2uC5doCo6VWJF9Vtrg&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_lookup&utm_source=tV7D2uC5doCo6VWJF9Vtrg', phone: '+34915278340', display_phone: '+34 915 27 83 40', review_count: 662, categories: [{ alias: 'tapas', title: 'Tapas Bars' }], rating: 4.5, location: { address1: 'Calle de la Torrecilla del Leal, 12', address2: '', address3: '', city: 'Madrid', zip_code: '28012', country: 'ES', state: 'M', display_address: ['Calle de la Torrecilla del Leal, 12', '28012 Madrid', 'Spain'], cross_streets: '' }, coordinates: { latitude: 40.4110475, longitude: -3.6995454 }, photos: ['https://s3-media4.fl.yelpcdn.com/bphoto/d0VliNHmKppFLz8lwHEnqg/o.jpg', 'https://s3-media2.fl.yelpcdn.com/bphoto/9NhGe0qp0XGGX_akVPUN7g/o.jpg', 'https://s3-media4.fl.yelpcdn.com/bphoto/HDSc745VKdAdayaoTQ72fg/o.jpg'], price: '€€', hours: [{ open: [{ is_overnight: true, start: '1200', end: '0130', day: 0 }, { is_overnight: true, start: '1200', end: '0130', day: 1 }, { is_overnight: true, start: '1200', end: '0130', day: 2 }, { is_overnight: true, start: '1200', end: '0130', day: 3 }, { is_overnight: true, start: '1200', end: '0200', day: 4 }, { is_overnight: true, start: '1200', end: '0200', day: 5 }, { is_overnight: true, start: '1200', end: '0130', day: 6 }], hours_type: 'REGULAR', is_open_now: true }], transactions: [] }

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
      query_params(params)
      # @connection.get('businesses/search', query_params(params))
      # raise UnprocessableRestaurantSearchError unless response.success?

      # parse_response(response)
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
      params[:sort_by] ||= DEFAULT_SORT_BY
    end

    def force_offset_param(params)
      params[:offset] ||= DEFAULT_OFFSET
    end

    def force_limit_param(params)
      params[:limit] ||= DEFAULT_LIMIT
    end

    def force_restaurant_category(params)
      params[:categories] = Array(params[:categories]).push(:restaurants)
    end

    def format_categories_param(params)
      params[:categories] = Array(params[:categories]).uniq.join(',')
    end

    def format_price_param(params)
      parms[:price] = Array(params[:price]).uniq.join(',')
    end

    def parse_response(response)
      JSON.parse(response, symbolize_names: true)
    end
  end
end
