Rails.application.routes.draw do
  
  root 'post#index'
  get 'post/new'
  get 'post/create'
  get 'post/show/:id' => 'post#show'

  get 'post/create_reply/:id' => 'post#create_reply'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
