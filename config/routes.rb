Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'home#index'

  devise_scope :user do
      get 'login', to: 'devise/sessions#new'
  end

  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end

  devise_scope :user do
    get 'sign_out' => 'devise/sessions#destroy'
  end

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :competitions
  resources :enrollments, only: [:create, :destroy, :update]
end