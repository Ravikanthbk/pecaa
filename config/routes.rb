Mystore3::Application.routes.draw do


  get "site_pages/index"

  resources :themes

  resources :base_colors

  resources :texts


  resources :sub_permissions

  resources :permissions
  
  get "roles/index"
  post "roles/index"
  resources :roles
  resources :add_files
  resources :add_forms
  resources :external_links
  
  resources :sites do 
    get 'preview', :on => :member
    post 'site_link_account', :on => :collection
    get 'rendering_partial', :on => :member
    post 'search', :on => :collection
    get 'pages_list', :on => :collection
    resources :site_pages do
      get 'copy_page', :on => :member
      post 'rename_page', :on => :collection
      get 'update_page', :on => :member, :to => 'site_pages#update'
      get 'seo_page', :on => :member
    end
    resources :site_links do
      post 'search', :on => :collection
    end
  end
  
  resources :images
  resources :videos


  match 'content_libraries/search', :to=> 'content_libraries#search',:as=>:content_search
  
resources :content_libraries do
    
  end
  

  match 'colorpicker', :to => "base_colors#colorpicker", :as => :colorpicker 
  
  get "users/index"

#  resources :add_files do
#   member do
#     post 'download'
#   end
#   end
  match 'add_files/download' => 'add_files#download', :as => :download
#  resources :profiles
#
#  match 'profiles/update_state_select/:id', :controller=>'profiles', :action => 'update_state_select'
#
#  match 'profiles/update_city_select/:id', :controller=>'profiles', :action => 'update_city_select'

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
 resources :users do 
   post 'search', :on => :collection
 end

 devise_for :user
#         :path_names => {:sign_in => "", :sign_out => "logout",:sign_up => "register"}


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
