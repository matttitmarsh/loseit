Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'home#index'

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
    get 'sign_out' => 'devise/sessions#destroy'
  end

  resources :competitions do
    resources :weight_records
  end
  resources :enrollments, only: [:create, :destroy, :update]
end