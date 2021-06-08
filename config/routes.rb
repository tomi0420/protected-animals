Rails.application.routes.draw do
  devise_for :conservation_groups
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }  
  devise_scope :user do
    get 'user/addresses', to: 'users/registrations#new_user_address'
    post 'user/addresses', to: 'users/registrations#create_user_address'
  end
  root to: 'animals#index'
  resources :animals, except: :destroy do
    collection do
      get 'search'
      get 'complex_search'
    end
  end
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
end
