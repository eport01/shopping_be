Rails.application.routes.draw do
  resources :users
  resources :products 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get "/login", to: "users#login"
end
