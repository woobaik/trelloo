Rails.application.routes.draw do
  resources :cards
  resources :lists
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/*path', to: 'application#index', format: false
end
