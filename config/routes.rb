Siamcomplain::Application.routes.draw do

  get "vote_comments/new"

    resources :vote_articles
    resources :vote_comments
    resources :comments
    resources :pages
    resources :articles
    resources :users
    resources :sessions, :only => [:new , :create,:destroy]     
    match '/signup',  :to => "users#new" 
    match '/signin',  :to => "sessions#new"
    match '/signout', :to => "sessions#destroy"
    match '/home', :to => "pages#home"
    #vote article
    match '/vote_articles_up',:to => "vote_articles#up",:via => :post  
    match '/vote_articles_down',:to => "vote_articles#down",:via => :post
    match '/vote_articles_de_vote',:to => "vote_articles#de_vote",:via => :post
    #vote comment
    match '/vote_comments_up',:to => "vote_comments#up",:via => :post  
    match '/vote_comments_down',:to => "vote_comments#down",:via => :post

match 'contact/' => 'pages#contactUs'
root :to => 'pages#home'



  # The priority is based upon order of creation:
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
