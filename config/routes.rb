Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'songs/edit'

  get 'songs/index'

  get 'songs/new'

  resources :songs
end
