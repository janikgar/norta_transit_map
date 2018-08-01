Rails.application.routes.draw do
  root 'platform#view'
  get 'route' => 'platform#route'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'auth/:provider/callback' => 'sessions#create'
  get '/signout' => 'sessions#destroy', as: :signout
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
