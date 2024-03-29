GameTheoryExp::Application.routes.draw do
  
  devise_for :users, :controllers => {:registrations => 'registrations'} do
    get 'logout' => 'devise/sessions#destroy'
  end


  resources :authentications
  get "home/index"

  get "sessions/new"
  get "sessions/create"
  get "sessions/failure"
  
  match "/game/start", :controller => "game", :action => "gamestart"
  match "/game/channel1", :controller => "game", :action => "channel1"
  match "/game/channel2", :controller => "game", :action => "channel2"
  match "game/propose", :controller => "game", :action => "propose"
  match "game/respond", :controller => "game", :action => "respond"
  match '/game',  :to => 'game#create'

  #get   '/login', :to => 'sessions#new', :as => :login
  match '/auth/:provider/callback', :to => 'authentications#create'
  match '/auth/failure', :to => 'sessions#failure'
  #get '/logout', :to => 'sessions#destroy'



  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)
 
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

  root :to => 'home#index'


  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
