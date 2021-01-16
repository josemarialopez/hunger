Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[create] do
        collection do 
          delete 'profile', action: :destroy_profile
          get 'profile', action: :show_profile
          post 'login'
          put 'profile', action: :update_profile
        end
      end
    end
  end
end