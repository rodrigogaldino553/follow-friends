Rails.application.routes.draw do
  resources :posts do
    resources :comments, except: %i[index]
    member do
      get :unapproved_posts
    end
  end
  # get '/posts/unapproved', to: 'posts#unapproved', as: 'unapproved_posts'

  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }

  resources :users
  post '/users/:id/follow', to: "users#follow", as: "follow_user"
  post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"
  get '/users/:id/followers', to: "users#followers", as: "user_followers"
  get '/users/:id/followees', to: "users#followees", as: "user_followees"


  get '/users', to: 'users#index', as: 'users_index'
  get '/users/:id/show', to: 'users#show', as: 'users_show'
  get '/users/:id/edit', to: 'users#edit', as: 'users_edit'
  put '/users/:id/update', to: 'users#update', as: 'users_update'
  get '/users/:id/posts', to: 'users#posts', as: 'users_posts'
  get '/users/:id/assign_role', to: 'users#assign_role', as: 'users_assign_role'

  get '/welcome/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
end
