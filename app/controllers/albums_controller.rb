class AlbumsController < ApplicationController

  def main
    @albums = Album.where(pet_id: set_pet_id)
    @pet_id = set_pet_id
    @pet = Pet.where(id: @pet_id)
  end

  def new
  	@album = Album.new
    @pet_id = set_pet_id
  end

  def create
  	@album = Album.new(album_params)
    if @album.save
      redirect_to new_photo_path(@album.pet_id, @album.id)
    else
      render :new
    end
  end

  def show
    @album = set_album
    @pet_id = set_pet_id
    @pet = Pet.where(id: @pet_id)
    @photos = Photo.where(album_id: @album.id)
    @user = current_user
  end

  def edit
    @album = set_album
  end

  def update
    @album = set_album
    if @album.update_attributes(album_params)
      redirect_to album_path @album.pet_id, @album.id
    else
      render :edit
    end
  end

  def delete
    @album = set_album
    @pet_id = @album.pet_id
    @album.destroy
    redirect_to pet_path(@pet_id)
  end

  private

  def set_album
    Album.find(params[:id])
  end

  def set_pet_id
    params[:pet_id]
  end

  def album_params
  	params.require(:album).permit(:title, :description, :pet_id)
  end

end
