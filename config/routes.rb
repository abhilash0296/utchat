Rails.application.routes.draw do
  root to: 'welcome#index'
  devise_for :users
  
  get  '/users/:user_id/chats/index',           to: 'chat#index',          as: 'chats'
  get  '/users/:user_id/chats/:chat_id',        to: 'chat#show',           as: 'show_chat'
  get  '/users/:user_id/chat/create',          to: 'chat#create',         as: 'create_chat'
  post '/users/:user_id/chat/create_message',  to: 'chat#create_message', as: 'create_message'
  
end
