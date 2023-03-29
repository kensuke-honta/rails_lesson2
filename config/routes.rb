Rails.application.routes.draw do
  get "profile/edit" => "profile#edit"
  patch "/users/:id" => "profile#update"
    resources:profile,only: %i[show edit update]

    get "/rooms/index" => "rooms#index"
    resources :rooms
    resources :rooms, only: [:index, :show]

  get 'search' => 'rooms#search'

  
  get 'reservations/index', to: 'reservations#index'
   get 'reservations/new', to: 'reservations#new'
   post "reservations/confirm" => "reservations#confirm" , as: 'reservations_confirm'# 確認画面
post 'reservations/back' # 確認画面から「入力画面に戻る」をクリックしたとき
post 'reservations/complete' # 完了画面
  
  
  resources :reservations
  devise_for :users
 
  get '/users/:id', to: 'users#show', as: 'user'
  
  
  get "/" => "home#top"
 
  
  resources:home

  
  
  
  
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
