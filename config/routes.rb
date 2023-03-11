Rails.application.routes.draw do
  get '/profile/edit' => "profile#edit"
  resources:profile
  
  
  devise_for :users
 
  get '/users/:id', to: 'users#show', as: 'user'
  
  
  get "/" => "home#top"
  
  resources:home

  
  
  
  
  
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
