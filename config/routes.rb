Rails.application.routes.draw do

  root 'pages#welcome'

  # resources :users do
  #   resources :course_folders
  # end
  resources :users
  
  resources :course_folders do
    member do
        put "like", to: "course_folders#upvote"
        put "dislike", to: "course_folders#downvote"
    end
  end
  
  resources :courses
  resources :notes
  
  get   '/about',    to: 'pages#about'

  get   '/welcome', to: 'pages#welcome'

  get 	'/login', 	to: 'sessions#new'

  post 	'/login', 	to: 'sessions#create'

  get   '/signup',   to: 'users#new'

  post   '/signup',   to: 'users#create'

  delete '/logout',	to: 'sessions#destroy'

  patch '/course_folders/:id/upload', to: 'course_folders#upload'

  post  '/courses/search', to: 'courses#search', as: "search_courses"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
