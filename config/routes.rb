Icici::Application.routes.draw do

  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout

  match '/welcome' => 'home#welcome', :as => :welcome

  resources :users do
    collection do
      get 'dashboard'
    end
  end
  resources :user_sessions
  root :to => 'users#dashboard'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
