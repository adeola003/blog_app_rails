Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'users#index' # All users page
  get '/users/:id', to: 'users#show', as: 'user' # Single user page
  get '/users/:user_id/posts', to: 'posts#index_by_user', as: 'user_posts' # All posts by a given user page
  get '/posts/:id', to: 'posts#show', as: 'post' # Single post page
#
resources :users, only: [:index, :show] do
  resources :posts, only: [:index, :show, :new, :create] do
    resources :comments, only: [:create]
  end
  member do
    post 'like', to: 'posts#like', as: 'like_post'
  end
end

resources :posts, only: [] do
  post 'like', to: 'likes#create', on: :member
end

end
