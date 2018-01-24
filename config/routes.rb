Rails.application.routes.draw do

  devise_for :users
  resources :assets
  resources :departments
  resources :downloads
  resources :user_courses
  resources :requests

  resources :courses do
    member do
      get :new_course_by_department
    end
  end

  root 'pages#index'

  get '/users/:id', :controller => 'users', :action => 'show', as: 'profile'

end
