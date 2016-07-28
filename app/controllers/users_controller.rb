class UsersController < ApplicationController

  def main

    #sort pets with search
    if params[:search]
      @pets = Pet.search(params[:search])
    else
    	@pets = Pet.all
    end
    # @pets = Pet.search(params[:search])
  	@photos = Photo.all
  	@pet_array = []
    @pet_indexes = []
  	@photo_array = []
    @following_pets = []
    @following_photos = []

    #collect all pets being followed
    if user_signed_in?
      followings = Follower.where(user_id: current_user.id)
      followings.each do |follow|
        pet = Pet.where(id: follow.pet_id)
        @following_pets << pet[0]
        album = Album.where(pet_id: pet[0].id)
        photo = Photo.where(album_id: album[0].id)
        @following_photos << photo[0]
      end
    end

    # @pets.each do |pet|
    #   test = true
    #   @following_pets.each do |following|
    #     if following.id == pet.id
    #       test = false
    #     end
    #   end
    #   if test
    #     albums = Album.where(pet_id: pet.id)
    #     if albums.length != 0
    #       photos = Photo.where(album_id: albums[0].id)
    #       if photos.length != 0
    #         @photo_array << photos[0]
    #         @pet_array << pet
    #       end
    #     end
    #   end
    # end

  end

end

    # # sort out pets without albums
    # while @pet_array.length < 50 and @pet_array.length < @pets.length do
    #   @pets.each do |pet|
    #     albums = Album.where(pet_id: pet.id)
    #     if albums.length > 0
    #       albums.each do |album|
    #         photos = Photo.where(album_id: album.id)
    #         if photos.length > 0
    #           @photo_array << photos[0]
    #           @pet_array << pet
    #         end
    #       end
    #     end
    #   end
    # end


    # # while loop to randomize pets show in main page
    # while @pet_array.length < 50 and @pet_array.length < (@pets.length-@following_pets.length) do
    #   @test = true
    #   @num = rand(@pets.length).to_i

    #   @pet_indexes.each do |x|
    #     if x == @num
    #       @test = false
    #     end
    #   end

    #   @following_pets.each do |pet|
    #     if pet.id == @pets[@num].id
    #       @test = false
    #     end
    #   end

    #   if @test
    #     #find album belonging to pet
    #     @album = Album.where(pet_id: @pets[@num].id)
    #     if @album.length != 0
    #       #find one photo
          
    #       @photo_array << Photo.where(album_id: @album[0].id)[0]
    #       @pet_array << @pets[@num]
    #       @pet_indexes << @num
    #     end
    #   end
    # end