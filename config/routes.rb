Rails.application.routes.draw do
  get '/overview', to: 'main_servers#index', as: 'main_servers'
  resources :restaurants
  root 'restaurants#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
