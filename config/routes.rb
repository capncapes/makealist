Rails.application.routes.draw do
  
  resources :lists do
    resources :products, except: [:index]
  end

  devise_for :users
  
  root 'welcome#index'
end
