Rails.application.routes.draw do
  get 'home/index'
  get 'home/reservations'
  get 'home/faq'
  get 'home/reserve'
  get 'home/student'
  get 'admin/index'
  get 'admin/pending'
  get 'admin/faq'
  get 'admin/approved'
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
