class Api::V1::RecentPhotosController < ApplicationController
  def index
    Photo.pull_recent
    @photos = Photo.all
    render json: @photos
  end

  def show
    photo_id = params[:id]
    @photo = Photo.pull_info(photo_id)
    render json: @photo
  end
end
