Rails.application.routes.draw do
  
  root to: 'home#index'

  resources :whiteboards
  get 'whiteboards/:id', to: 'whiteboards#show'

  get 'home/wbpage'
  get 'home/index'
  get 'home/info'

  devise_for :users

  mount ActionCable.server => '/cable'
  post '/update', to: 'whiteboards#showcable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
