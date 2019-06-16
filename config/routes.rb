Rails.application.routes.draw do
  
  root    'static_pages#home'
  get     '/help',            to: 'static_pages#help'
  get     '/about',           to: 'static_pages#about'
  get     '/contact',         to: 'static_pages#contact'
  get     '/signup',          to: 'users#new'
  post    '/signup',          to: 'users#create'
  get     '/login',           to: 'sessions#new'
  post    '/login',           to: 'sessions#create'
  delete  '/logout',          to: 'sessions#destroy'
  
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]

  # May want to revisit this: going to see how far we get working with
  # lists through the User's home and profile page but will still likely
  # require independent actions/views for list operations
  resources :lists,               only: [:create, :destroy]
end