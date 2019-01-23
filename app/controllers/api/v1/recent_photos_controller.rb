class Api::V1::RecentPhotosController < ApplicationController
  def index
    Photo.pull_recent
    @photos = Photo.all
    render json: @photos
  end

  def show
    photo_id = params[:id]
    @photo = RestClient::Request.execute(method: "get",
      url: "https://api.flickr.com/services/rest/?method=flickr.photos.getInfo&api_key=" + ENV['API_KEY'] + "&photo_id=#{photo_id}&format=json&nojsoncallback=1")
      render json: @photo
  end
end
