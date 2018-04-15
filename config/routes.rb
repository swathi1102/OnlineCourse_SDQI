Rails.application.routes.draw do
  get 'home/index'

  get 'enrollment/enroll'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # Home Page
  root to: "home#index"
  get 'home/study'

  # Enrollment Page
  get 'enrollment/new'
  post 'enrollment/create'
  get 'enrollment/index'
  get 'enrollment/grade'
  post 'enrollment/grade'

  # Manage Courses
  resources :courses
  devise_for :users

  resources :discussions do
    resources :replies
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
