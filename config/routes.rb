Rails.application.routes.draw do
  resources :products

  get 'buy', to: 'products#buy'
  get 'read', to: 'products#read'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
