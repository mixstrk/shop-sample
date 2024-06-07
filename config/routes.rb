Rails.application.routes.draw do
  namespace :api do
    resources :products, only: %i[index show]
    namespace :cart do
      resources :items, only: %i[create update destroy index] do
        collection do
          get "items_count"
          get "destroy_all"
        end
      end
    end
    resources :orders, only: %i[create index show]
  end
end
