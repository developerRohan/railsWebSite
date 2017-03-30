Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root  'pages#home'
  get '/about' => 'pages#about'
  resources :articles
  get 'signup' => 'users#new'
  post 'users' => 'users#create'
  #resources :users, except:[:new]
  #get '/articles' => 'articles#index'
  # get '/articles/new' => 'articles#new'
  # get '/articles/:id' => 'articles#show'
  # post '/articles/create' => 'articles#create'
  # get '/articles/:id/edit' => 'articles#edit'
  # post '/articles/:id/update' => 'articles#update'
  # get '/articles/:id/delete' => 'articles#delete'
  

end
