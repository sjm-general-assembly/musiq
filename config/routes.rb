Musiq::Application.routes.draw do

	# all standard Restful CRUD routes (listed example for examples, also includes users, sessions)
	#      root GET       /                            examples#index
	#     examples GET    /examples(.:format)          examples#index
	#              POST   /examples(.:format)          examples#create
	#  new_example GET    /examples/new(.:format)      examples#new
	# edit_example GET    /examples/:id/edit(.:format) examples#edit
	#      example GET    /examples/:id(.:format)      examples#show
	#              PATCH  /examples/:id(.:format)      examples#update
	#              PUT    /examples/:id(.:format)      examples#update
	#              DELETE /examples/:id(.:format)      examples#destroy
	resources :users, :sessions

  # create a route for root link, sending to main/home page (index)
  root to: 'sites#index'

	# list routes for user login logout & sign up
	get '/signup' => 'users#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  get'/signin' => 'sessions#new'


end
