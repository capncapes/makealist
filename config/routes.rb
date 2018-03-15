Rails.application.routes.draw do

	resources :lists do
		resources :basics, except: [:index]
		resources :products, except: [:index]
	end

	devise_for :users

	get 'about' => 'welcome#about'
	root 'welcome#index'
end
