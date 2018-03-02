Rails.application.routes.draw do

  resources :lists do
  	resources :basics, except: [:index]
    resources :products, except: [:index]
  end

  devise_for :users
  
  root 'welcome#index'
end
