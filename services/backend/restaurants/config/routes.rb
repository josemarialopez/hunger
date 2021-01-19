# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :restaurants, only: [:index] do
        collection do
          get :categories
        end
      end
    end
  end
end
