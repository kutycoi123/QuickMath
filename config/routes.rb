Rails.application.routes.draw do
    
  get 'login/index'
  root 'login#index'
    
  get 'pages/welcome'
  root 'pages#welcome'
  
  get 'pages/about'
  root 'pages#about'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

