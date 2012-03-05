Mystore3::Application.routes.draw do

  resources :sub_permissions

  resources :permissions

  resources :sites do 
    get 'preview', :on => :member
    post 'search', :on => :collection
    resources :site_links do
      post 'search', :on => :collection
    end
  end
  
  resources :images
  resources :videos
  resources :content_libraries

  get "users/index"
  
  # match 'users/list', :to => "users/users#index", :as => :user_list
  # namespace :users do
  #   resources :users
  # end
  
  devise_scope :user do
    get "login"  => "devise/sessions#new"    
    get "logout" => "devise/sessions#destroy"
  end
  post '/users/index'
#  devise_for :users
#  resources :users

# devise_for :users,  :controllers => { :registrations => "users/registrations" }
 resources :users
 devise_for :user
#         :path_names => {:sign_in => "", :sign_out => "logout",:sign_up => "register"}


#  get 'uploads/new'
#  get 'uploads/index'
#  get 'uploads/show'
#  get 'uploads/destroy'
#  match 'uploads/delete', :to => 'uploads#delete'
#  match 'uploads/show', :to => 'uploads#show'

  resources :uploads
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
   root :to => 'users#dashboard'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
   match ':controller(/:action(/:id(.:format)))'
end
