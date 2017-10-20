Rails.application.routes.draw do
  resources :users
  resources :groups
  resources :sessions
  get '/' => 'sessions#new'
  get '/groups/:id/member' => 'members#create'
  delete '/groups/:id/member' => 'members#destroy'

end
