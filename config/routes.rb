Rails.application.routes.draw do
  root "spaces#index"
  devise_for :users, controllers: { sessions: 'users/sessions' }

  resources :spaces, only: [:index, :show, :new, :create]
  resources :leases, only: [:new, :create, :show]



    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  


end
