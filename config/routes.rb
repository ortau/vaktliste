Vaktliste::Application.routes.draw do
  resources :availability_statuses

  get "user_sessions/new"
  get "user_sessions/create"
  get "user_sessions/destroy"
  resources :seasons do
    resources :workdays
  end
  resources :user_sessions

  match 'login' => 'user_sessions#new', :as => :login, via: [:get, :post]
  match 'logout' => 'user_sessions#destroy', :as => :logout,  via: [:get, :post]

  root "users#index"
  get "vakter" => "users#index", as: "vakter"
  post "vakter" => "users#create", as: "opprett_vakt"
  get "vakter/ny" => "users#new", as: "ny_vakt"
  get "vakter/:id" => "users#show", as: "vakt"
  get "vakter/:id/rediger" => "users#edit", as: "rediger_vakt"

  get "user/:id" => "users#show", as: "user"
  get "users/new" => "users#new", as: "users"
  patch "user/:id" => "users#update"

  post "workdays/:id" => "workdays#update"
  patch "workdays/:id" => "workdays#update"


end
