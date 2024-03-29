Rails.application.routes.draw do
  
  get 'user/new'

  get 'user/create'

  get 'user/login'

  get 'user/login_process'

  get 'user/logout'

  root 'post#index'
  get 'post/new'
  get 'post/create'
  get 'post/show/:id' => 'post#show'

  get 'post/update/:id' => 'post#update'

  get 'post/destroy/:id' => 'post#destroy'

  get 'post/edit/:id' => 'post#edit'
  get 'post/create_reply/:id' => 'post#create_reply'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
