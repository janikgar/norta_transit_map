Rails.application.routes.draw do
  root 'platform#home'
  get 'select_route' => 'platform#select_route'
  get 'system_map' => 'platform#view'
  get 'route_map' => 'platform#route'
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
end
