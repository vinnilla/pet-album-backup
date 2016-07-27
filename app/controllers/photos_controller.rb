class PhotosController < ApplicationController

  def main
    @photos = Photo.where(album_id: set_album_id)
  end

  def new
  	@photo = Photo.new
    @album_id = set_album_id
  end

  def create
  	@photo = Photo.new(photo_params)
    @album_id = set_album_id
    @pet_id = set_pet_id
    if @photo.save
      redirect_to album_path @pet_id, @album_id
    else
      render :new
    end
  end

  def show
    @photo = set_photo
    @album_id = set_album_id
    @pet_id = set_pet_id
    @pet = Pet.where(id: @pet_id)

  end

  def edit
    @photo = set_photo
  end

  def update
    @photo = set_photo
    @album_id = set_album_id
    @pet_id = set_pet_id
    if @photo.update_attributes(photo_params)
      redirect_to photo_path @pet_id, @album_id, @photo.id
    else
      render :edit
    end
  end

  def delete
    @photo = set_photo
    @album_id = set_album_id
    @pet_id = set_pet_id
    @photo.destroy
    redirect_to album_path @pet_id, @album_id
  end

  private

  def set_photo
    Photo.find(params[:id])
  end

  def set_album_id
    params[:album_id]
  end

  def set_pet_id
    params[:pet_id]
  end

  def photo_params
  	params.require(:photo).permit(:description, :album_id, :avatar, :remote_avatar_url)
  end

end
