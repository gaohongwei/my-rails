

  namespace :api do
    namespace :v1, defaults: {format: :json, via: :all} do
      resources :currency_codes, only: [] do
        member do
          get :rate_to_usd
        end
      end
      resources :inquiries, only: [:create]
      resources :labs, only: [] do
        collection do
          get :affiliation
        end
      end
      resources :mailing_list_subscriptions, except: [:new, :edit]
    end
    namespace :v2 do
      namespace :amgen do
        resources :requests
      end
    end
  end