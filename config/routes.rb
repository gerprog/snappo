Challenge::Application.routes.draw do
  resources :flatboxes

  resources :wordups

  resources :lightboxes

  get "lightboxes/index"
  post "lightboxes/index"

  resources :forums

    # resources :galleries do
    #   member do
    #     post :vote_for
    #     post :vote_against
    #   end
    # end

    #below replacing the posts above due to ajax issue w vote btns
    #but then reverted back when ajax was removed after not allowing submit on my gem's form!
      resources :galleries do
       member do
         get :vote_for
        get :vote_against
       end
     end

  #post "users/new"

  post "users/new"
  get "users/new"
  post "users/edit"

  get "users/welcome"
  post "users/welcome"
  get "welcome/home"
  get "welcome/thank_you"
  get "welcome/register"

  resources :orders

  resources :line_items

  resources :carts

  resources :users

  resources :sessions

  #strange that this is not necessary and causes an issue
  #resources :challenges

  match '/login' => "sessions#new", :as => "login"
  match '/logout' => "sessions#destroy", :as => "logout"

  get "challenges/index"
  post "challenges/index"
  get "challenges/thanks"
  get "challenges/typesof"
  get "challenges/titles"
    post "challenges/titles"
  get "challenges/captions"
  get "challenges/locations"
  get "challenges/themes"
    get "challenges/show"
      get "challenges/caption"
      get "challenges/copyright"

  resources :challengers do
    get :who_bought, on: :member
  end

  get "challenges/make_one"
  post "challenges/make_one"
  post "challenges/typesof"

  get "challenges/thanks_for_photo"



  get "carts/show"
  post "carts/show"
  get "carts/new"

  post "galleries/show"
  get "galleries/show"

  controller :sessions do
    get  'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  get "sessions/new"

  get "sessions/create"

  get "sessions/destroy"

  match '/check', :controller=>'wordups', :action=>'checktext'
  match '/validate', :controller=>'wordups', :action=>'ischecked'

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
  root :to => 'challenges#index', as: 'challenges'
  root :to => "challenges", :action => "index"


  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
