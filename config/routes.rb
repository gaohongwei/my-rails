Rails.application.routes.draw do
  root to: 'pages#index'
  namespace :api do
    namespace :v1 do
      resources :weathers, only: :index
      resources :items
      resources :todos

    end
  end

  resources :items # for UI routes
  resources :todos # for UI routes
  resources :weathers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/*id' => 'pages#show', as: :page, format: false
end
