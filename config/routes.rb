DeployNinja::Application.routes.draw do

   root 'welcome#index'

   namespace :api do
     resources :deployments, only: [:create]
     get 'deployments/:tag', to: 'deployments#index'
     get 'deployments/:tag/last', to: 'deployments#show'
   end
end
