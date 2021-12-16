Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/register',  to: 'users#new', as: 'new_user'
  post '/users',    to: 'users#create', as: 'create_user'
  get '/login',     to: 'sessions#new', as: 'login'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  get '/dashboard',          to: 'users#show', as: 'user'
  get '/discover', to: 'users#discover', as: 'discover'

  get '/movies',          to: 'movies#index'
  get '/movies/:id', to: 'movies#show'

  get '/movies/:movie_id/viewing-party/new', to: 'parties#new'
  post '/movies/:movie_id/viewing-party',    to: 'parties#create', as: 'new_party'
  post '/parties',                           to: 'user_parties#create', as: 'new_user_party'
end
