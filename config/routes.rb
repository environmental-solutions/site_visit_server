Rails.application.routes.draw do

  devise_for :users
  post "/graphql", to: "graphql#execute"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'hello_world', to: 'hello_world#index'
  root to: "home#index"

end
