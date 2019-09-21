Rails.application.routes.draw do
  
  devise_for :users, controllers: { registrations: 'registrations' }
  
  
  resources :cards do
    member do 
      put :move
    end
    resources :lists do
      member do
        patch :move
      end
    end 
  end
  root 'home#index'
end
