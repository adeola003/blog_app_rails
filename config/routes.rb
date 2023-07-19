Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'users#index' # All users page
  get '/users/:id', to: 'users#show', as: 'user' # Single user page
  get '/users/:user_id/posts', to: 'posts#index_by_user', as: 'user_posts' # All posts by a given user page
  get '/posts/:id', to: 'posts#show', as: 'post' # Single post page
end
