Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }  
  devise_scope :user do
    get 'user/addresses', to: 'users/registrations#new_user_address'
    post 'user/addresses', to: 'users/registrations#create_user_address'
  end
  root to: 'animals#index'
  resources :animals, except: :destroy
end
