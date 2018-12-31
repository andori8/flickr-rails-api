Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post 'api/search', to: 'search_photo#index'
      get 'api/popular', to: 'popular_photos#index'
      get 'api/popular/:id', to: 'popular_photos#show'
      get 'api/recent', to: 'recent_photos#index'
      get 'api/recent/:id', to: 'recent_photos#show'
    end
  end
end
