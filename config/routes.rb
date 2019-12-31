Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  get 'graph/index'
  resource :graphql, only: :create
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
