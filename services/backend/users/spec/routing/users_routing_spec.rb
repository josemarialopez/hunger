# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :routing do
  describe 'routing' do
    it 'routes to #destroy_profile' do
      expect(delete: '/api/v1/users/profile').to route_to('api/v1/users#destroy_profile')
    end

    it 'routes to #show_profile' do
      expect(get: '/api/v1/users/profile').to route_to('api/v1/users#show_profile')
    end

    it 'routes to #login' do
      expect(post: '/api/v1/users/login').to route_to('api/v1/users#login')
    end

    it 'routes to #update_profile' do
      expect(put: '/api/v1/users/profile').to route_to('api/v1/users#update_profile')
    end

    it 'routes to #create' do
      expect(post: '/api/v1/users').to route_to('api/v1/users#create')
    end
  end
end
