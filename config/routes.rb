Rails.application.routes.draw do
  resources :reservations
  resources :avrs
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: "users/omniauth_callbacks"
    
  }
  get 'home/index'
  get 'home/myreservations'
  get 'home/faq'
  get 'home/reserve'
  get 'home/student'
  get 'admin/index'
  get 'admin/pending'
  get 'admin/faq'
  get 'admin/avr'
  get 'admin/approved'
  get 'home/reserve'
  get 'users/sign_in'
  get 'users/index'
  get 'devise/sessions/new'
  get 'devise/sessions/new_admin'
  get 'reservations/new'
  get 'reservation/shared'

  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
