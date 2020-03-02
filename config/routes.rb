Rails.application.routes.draw do
  resources :songs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts, only: [:index, :show, :new, :create, :edit, :update]
  root 'songs#index'
  # get "/authors/new", to: "authors#new", as: "new_author"
end
