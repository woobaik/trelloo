Rails.application.routes.draw do
  
  devise_for :users, controllers: { registrations: 'registrations' }
  
  
  resources :cards do
    resources :lists
  end
  root 'home#index'
end
