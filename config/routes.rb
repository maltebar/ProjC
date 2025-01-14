Rails.application.routes.draw do
  resources :pairs

  devise_for :users

  resources :notes do
    resources :assignments
  end

  resources :comments do
    resources :conversations
  end

  resources :submissions do
    resources :comments
  end

  resources :assignments do
    resources :submissions
    resources :conversations
    resources :notes
  end

  resources :users do 
    resources :assignments
    resources :comments
  end

  resources :conversations do
    resources :messages
  end

  authenticate :user do
    root 'assignments#index'
  end

  unauthenticated :user do
    devise_scope :user do
      get "/" => "devise/sessions#new"
    end
  end


  get 'assignments/studentreview/:assignment/:user' => 'assignments#studentreview'
  get 'assignments/adminreview/:assignment' => 'assignments#adminreview'
  get 'assignments/conversations/:id' => 'conversations#show'
  get 'assignments/studentreview/:assignment/conversations/:id' => 'conversations#show'

  post 'assignments/forward_phase'
  post 'assignments/backward_phase'


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
