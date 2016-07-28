class PetsController < ApplicationController
  before_action :authenticate_user!
 
  def main
    @pets = Pet.where(user_id: current_user.id)
  end

  def new
    @pet = Pet.new()
  end
  
  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      @pet.search_terms = "#{@pet.name} #{@pet.gender} #{@pet.breed} #{@pet.species}"
      redirect_to new_album_path @pet.id
    else
      render :new
    end
  end

  def show
    @pet = set_pet
    @albums = Album.where(pet_id: @pet.id)
    photos = Photo.all
    @photos = []
    @albums.each do |album|
      photos.each do |photo|
        if photo.album_id == album.id
          @photos << photo
          break
        end
      end
    end
  end  

  def edit
  	@pet = set_pet
  end

  def update
  	@pet = set_pet
    if @pet.update_attributes(pet_params)
      @pet.search_terms = "#{@pet.name} #{@pet.gender} #{@pet.breed} #{@pet.species}"
  		redirect_to pet_path
  	else
  		render :edit
  	end
  end

  def delete
  	@pet = set_pet
  	@pet.destroy
  	redirect_to pets_path
  end

  def follow
    @user = current_user
    @user.active_relationships.create(followed_id: set_pet.id)
  end

  private

  def set_pet
  	Pet.find(params[:id])
  end

  def pet_params
  	params.require(:pet).permit(:name, :gender, :breed, :species, :bio, :user_id, :search_terms)
  end
end
