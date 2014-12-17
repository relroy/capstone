Rails.application.routes.draw do
  namespace :api do
  namespace :v1 do
    get 'drivers/index'
    end
  end

  namespace :api do
  namespace :v1 do
    get 'syrup_flavors/index'
    end
  end

  devise_for :users

  devise_scope :user do
    authenticated :user do
     root 'products#index', as: :authenticated_root
    end

    unauthenticated do
     root 'devise/registrations#new', as: :unauthenticated_root
    end
  end

  namespace :api do
    namespace :v1 do
      resources :products, only: [:index]
      resources :ice_creams, only: [:index]
      resources :carted_products, only: [:index, :create, :update]
      resources :syrup_flavors, only: [:index]
      resources :frostbite_flavors, only: [:index]
      resources :frozen_latte_flavors, only: [:index]
      resources :ic_flavors, only: [:index]
      resources :containers, only: [:index]
      resources :smoothie_flavors, only: [:index]
      resources :options, only: [:index]
      resources :drivers, only: [:index]
    end
  end
  
  resources :products
  resources :carted_products
  resources :orders
  resources :containers
  resources :flavors
  resources :ic_flavors
  resources :options
  resources :sizes
  resources :frostbite_flavors
  resources :frozen_latte_flavors
  resources :containers
  resources :drivers
  resources :charges


  

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
