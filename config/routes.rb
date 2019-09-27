Rails.application.routes.draw do
  

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
