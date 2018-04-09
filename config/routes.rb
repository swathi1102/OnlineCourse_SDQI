Rails.application.routes.draw do
  get 'enrollment/enroll'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get 'home/study'
  get 'enrollment/new'
  post 'enrollment/create'
  get 'enrollment/index'
  get 'enrollment/grade'
  post 'enrollment/grade'
  root to: "home#index"
  resources :courses
  devise_for :users


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
