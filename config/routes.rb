Rails.application.routes.draw do
  resources :users
  get '/login' => 'sessions#new'
   resources :sessions
  post '/login' => 'session#create'
  post '/logout' => 'session#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
