Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post 'search', to: 'search_photos#index'
      get 'recent', to: 'recent_photos#index'
      get 'recent/:id', to: 'recent_photos#show'
    end
  end
end
