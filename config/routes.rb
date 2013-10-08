Collaboration::Application.routes.draw do

  resources :questions do
    resources :answers
  end


  resources :lessons
  root to: "lessons#index"

  resources :users, :admins do
    resources :codepens
    collection do
      get :login_from_http_basic
    end
    member do
      get :activate
    end
  end
  
  resources :user_sessions
  resources :password_resets
  
  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout

  get 'class' => 'codepens#class_index', as: :class
  get 'users/:id/admin' => 'users#admin', as: :admin
  get 'links' => 'links#index', as: :links
  get 'about' => 'application#about', as: :about
  post 'links' => 'links#create', as: :new_link
  get 'favorites' => 'codepens#favorites', as: :favorites
  match 'favorite' => 'codepens#favorite', :as => :favorite_codepen
  match 'unfavorite' => 'codepens#unfavorite', :as => :unfavorite_codepen

  get 'request_instructor_help' => 'users#request_instructor_help', as: :request_instructor_help
  get 'remove_as_admin' => 'users#remove_as_admin', as: :remove_admin
  get 'make_as_admin' => 'users#make_as_admin', as: :make_admin

  get 'lessons/:id/save' => 'lessons#save_draft', as: :save_lesson
  get 'lessons/:id/publish' => 'lessons#publish', as: :publish_lesson
  post 'lessons/:id/draft' => 'lessons#save_draft', as: :draft_lesson


  resource :oauth do
    get :callback
  end
  match "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider

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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
