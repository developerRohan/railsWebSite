Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root  'pages#home'
  get 'bored' => 'pages#bored'
  get '/about' => 'pages#about'
  resources :articles
  #get '/users' => 'users#index'
  # get '/users/:id' => 'users#show'
   get 'signup' => 'users#new'
  # post '/users' => 'users#create'
  # get  '/users/:id/edit' => 'users#edit'
  # post '/users/:id/update' => 'users#update'
  resources :users, except:[:new]
  #get '/articles' => 'articles#index'
  # get '/articles/new' => 'articles#new'
  # get '/articles/:id' => 'articles#show'
  # post '/articles/create' => 'articles#create'
  # get '/articles/:id/edit' => 'articles#edit'
  # post '/articles/:id/update' => 'articles#update'
  # get '/articles/:id/delete' => 'articles#delete'
  get '/login' => 'authentication#new'
  post '/login' => 'authentication#login'
  get '/logout' => 'authentication#logout'
  resources :categories , except:[:destroy]

end
