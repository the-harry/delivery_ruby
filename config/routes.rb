Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"

  namespace :api, constraints: { format: 'json' } do
    namespace :v1 do
      resources :orders, only: [:create]
    end
  end
end
