Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions:      'users/sessions',
    passwords:     'users/passwords'
  }  
  devise_scope :user do
    get 'user/addresses', to: 'users/registrations#new_address'
    post 'user/addresses', to: 'users/registrations#create_address'
  end
  devise_for :conservation_group, controllers: {
    registrations: 'conservation_groups/registrations',
    sessions:      'conservation_groups/sessions',
    passwords:     'conservation_groups/passwords'
  }
  devise_scope :conservation_group do
    get 'conservation_group/addresses', to: 'conservation_groups/registrations#new_address'
    post 'conservation_group/addresses', to: 'conservation_groups/registrations#create_address'
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
  resources :rooms, only: [:new, :create]
end
