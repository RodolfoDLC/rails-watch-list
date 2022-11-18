Rails.application.routes.draw do
  get 'bookmarks/new'
  get 'bookmarks/create'
  get 'lists/index'
  get 'lists/new'
  get 'lists/show'
  get 'movies/index'
  get 'movies/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "movies#index"
  resources :movies, only: [:index, :show]
  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: [:destroy]
end
