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
    @following = []
    user = current_user

    #sort out pets without albums
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


    while @pet_array.length < 50 and @pet_array.length < @pets.length do
      @test = true
      @num = rand(@pets.length).to_i

      @pet_indexes.each do |x|
        if x == @num
          @test = false
        end
      end

      if @test
        #find album belonging to pet
        puts @pets[@num].id
        @album = Album.where(pet_id: @pets[@num].id)
        if @album.length != 0
          #find one photo
          
          @photo_array << Photo.where(album_id: @album[0].id)[0]
          @pet_array << @pets[@num]
          @pet_indexes << @num
        end
      end
    end
end


end
    # @pets.each do |pet|
    #   if user.following.include?(pet)
    #     @following << pet
    #   end
    # end