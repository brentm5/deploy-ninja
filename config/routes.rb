DeployNinja::Application.routes.draw do
  root 'welcome#index'

  namespace :api do
    resources :projects do
      resources :deployments, only: [:index]
      resources :last_deployment, only: [:index]
    end
    resources :deployments, only: [:create]
  end
end
