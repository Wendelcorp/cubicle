Rails.application.routes.draw do
  root "spaces#index"
  # devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }


  resources :spaces do
    resources :leases, only: [:new, :create, :show, :update]
  end
  resources :users, only: [:show]
  resources :images, only: [:index]
  resources :rooms, except: [:update, :edit, :destory]
  resources :messages, only: [:create]

  mount ActionCable.server => '/cable'



    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html




end
