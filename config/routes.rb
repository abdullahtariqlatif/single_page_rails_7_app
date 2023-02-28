Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'dashboards#index'

  get 'dashboards/index'

  post 'dashboard/create_user', to: 'dashboard#create_user'
  post 'dashboard/create_employment', to: 'dashboard#create_employment'
end
