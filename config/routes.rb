Rails.application.routes.draw do
  resources :posts do
    get :unapproved_posts
  end

  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }

  get '/users', to: 'users#index', as: 'users_index'
  get '/users/:id/show', to: 'users#show', as: 'users_show'
  get '/users/:id/edit', to: 'users#edit', as: 'users_edit'
  get '/users/:id/posts', to: 'users#posts', as: 'users_posts'

  get '/welcome/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
end
