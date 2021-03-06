BasecampClient::Application.routes.draw do
  get "people/index"

  match "people" => "people#index"

  get "people/person"

  get "people/delete"

  get "people/me"

  get "todolists/index"

  match "todolists" => "todolists#index"

  get "todolists/index_completed"

  get "todolists/items"

  get "todolists/new"

  get "todolists/new_item"

  post "todolists/create"

  post "todolists/create_item"

  get "todolists/delete_item"

  get "todolists/update"

  get "todolists/delete"

  get "projects/index"

  match "projects" => "projects#index"

  get "projects/get"

  get "projects/new"

  get "projects/update"

  get "projects/archive"

  get "projects/delete"

  get "oauth/login"

  # This is required for oauth callback
  get "oauth/request_token"

  match 'login' => 'oauth#login'

  match 'index' => 'oauth#login'

  # match 'projects' => 'oauth#login'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
