Rails.application.routes.draw do
  devise_for :users
  # root 'platform#view'
  root 'platform#home'
  get 'system_map' => 'platform#view'
  get 'route_map' => 'platform#route'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'auth/:provider/callback' => 'sessions#create'
  get '/signout' => 'sessions#destroy', as: :signout
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
