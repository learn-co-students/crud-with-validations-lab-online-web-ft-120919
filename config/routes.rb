Rails.application.routes.draw do
  get 'songs/edit'

  get 'songs/index'

  get 'songs/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :songs
end
