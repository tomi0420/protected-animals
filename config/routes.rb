Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }  
  devise_scope :user do
    get 'user/addresses', to: 'users/registrations#new_user_address'
    post 'user/addresses', to: 'users/registrations#create_user_address'
  end


  devise_for :conservation_group, controllers: {
    registrations: 'users/registrations'
  }

  
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
