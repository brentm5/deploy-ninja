DeployNinja::Application.routes.draw do
  root 'welcome#index'

  namespace :api do
    resources :projects do
      resources :deployments, only: [:index]
      resource :last_deployment, only: [:show]
    end
    resources :deployments, only: [:create]
  end
end
