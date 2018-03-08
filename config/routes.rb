Rails.application.routes.draw do

  root 'pages#welcome'

  resources :users do
    resources :course_folders
  end
  resources :course_folders
  resources :courses
  get   'sessions/new'

  get   'pages/welcome'

  get   'about',    to: 'pages#about'

  get    '/show',    to: 'users#show'

  get   '/welcome', to: 'pages#welcome'

  get 	'/login', 	to: 'sessions#new'

  post 	'/login', 	to: 'sessions#create'

  get   '/signup',   to: 'users#new'

  post   '/signup',   to: 'users#create'

  delete '/logout',	to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
