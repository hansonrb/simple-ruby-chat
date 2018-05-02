Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register', edit: 'settings' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'application#home'

  get '/home', to: 'application#home', as: 'home'
  get '/secret', to: 'application#secret', as: 'secret'
  get '/about', to: 'application#about', as: 'about'
  get '/contact', to: 'application#contact', as: 'contact'

  # by hanson
  get '/chats', to: 'application#chats', as: 'chats'
  post '/chats', to: 'application#chatform', as: 'new_chat'
  get '/chatform', to: 'application#chatform', as: 'chatform'
  post '/chatform', to: 'application#chatform', as: 'sendchat'
  delete '/chats/:id', to: 'application#delete_chat', as: 'delete_chat'
  get '/chatform/:id', to: 'application#edit_chat', as: 'chat'
  patch '/chatform/:id', to: 'application#update_chat', as: 'update_chat'
end
