Rails.application.routes.draw do
  	get 'recipes/index'
  	#index For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  	root 'pages#home'

	get 'pages/home', to: 'pages#home'

	resources :recipes 
	resources :chefs, except: [:new]
	get '/signup', to: 'chefs#new'
end
