SampleApp::Application.routes.draw do

# SEE:  Rails Guides article "Rails Routing from the Outide In"



# ??????
#  get "sessions/new"    # ???     Section 9.1.1 Sessions Controller





	# Listing 6.26 Rails 3 tutorial 
	resources :users
	resources :sessions, :only => [:new, :create, :destroy] # Section 9.1.1 Sessions Controller



 # Removed: see tutorial 6.3 text beneath Table 6.2
 # get "users/new"



 # matches the path (ie: /about) to action in Pages.controller

  match '/signup',  :to => 'users#new'  # this works from HOME page


 # TEST QQQR 
  match '/show',  :to => 'users#show'  



  match '/about',   :to => 'pages#about'
  match '/contact', :to => 'pages#contact'
  match '/home',    :to => 'pages#home'
  match '/help',    :to => 'pages#help'

  match '/index',   :to => 'pages#index' 


  # Section 9.1.1 Sessions Controller                                                       
  match '/signup',  :to => 'users#new'        
  match '/signin',  :to => 'sessions#new'     
  match '/signout', :to => 'sessions#destroy' 


  # this statement is equivalent to:  match '/', :to => 'pages#home'
  #  and also provides:    root_url => 'http://localhost:3000/'
  root :to => "pages#home"


   # get "pages/index"
   # get "pages/home"
   # get "pages/contact"
   # get "pages/about"




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
  # match ':controller(/:action(/:id(.:format)))'
end
