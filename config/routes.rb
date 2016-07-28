Rails.application.routes.draw do

  devise_for :users
  root 'users#main'

  get 'users' => 'users#main'
  
  post 'pets/:id' => 'users#follow', as: :follow
  
  #####
  #PETS
  #####
  get 'pets' => 'pets#main'
  #create profile
  get 'pets/new' => 'pets#new', as: :new_pet #retrieve form
  post 'pets' => 'pets#create' #post
  #display profile
  get 'pets/:id' => 'pets#show', as: :pet
  #edit profile
  get 'pets/:id/edit' => 'pets#edit', as: :edit_pet
  patch 'pets/:id' => 'pets#update', as: :update_pet
  #delete profile
  delete 'pets/:id' => 'pets#delete'

  #######
  #ALBUMS
  #######
  get 'pets/:pet_id/albums' => 'albums#main', as: :albums

  get 'pets/:pet_id/albums/new' => 'albums#new', as: :new_album
  post 'pets/:pet_id/albums' => 'albums#create', as: :create_album

  get 'pets/:pet_id/albums/:id' => 'albums#show', as: :album

  get 'pets/:pet_id/albums/:id/edit' => 'albums#edit', as: :edit_album
  patch 'pets/:pet_id/albums/:id' => 'albums#update', as: :update_album

  delete 'pets/:pet_id/albums/:id' => 'albums#delete'

  #######
  #PHOTOS
  #######
  get 'pets/:pet_id/albums/:album_id/photos/' => 'photos#main', as: :photos

  get 'pets/:pet_id/albums/:album_id/photos/new' => 'photos#new', as: :new_photo
  post 'pets/:pet_id/albums/:album_id/photos' => 'photos#create', as: :create_photo

  get 'pets/:pet_id/albums/:album_id/photos/:id' => 'photos#show', as: :photo

  get 'pets/:pet_id/albums/:album_id/photos/:id/edit' => 'photos#edit', as: :edit_photo
  patch 'pets/:pet_id/albums/:album_id/photos/:id' => 'photos#update', as: :update_photo

  delete 'pets/:pet_id/albums/:album_id/photos/:id' => 'photos#delete'

  ##########
  #FOLLOWING
  ##########
  post 'pets/:id/follow' => 'pets#follow', as: :follow_pet
  delete 'pets/:id/unfollow' => 'pets#unfollow', as: :unfollow_pet

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
