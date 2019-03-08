Rails.application.routes.draw do
  
  root to: 'home#index'

  get 'whiteboard/wbpage'

  get 'home/index'
  get 'home/info'

  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
