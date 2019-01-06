class Api::V1::SearchPhotosController < ApplicationController
  def index
    search = search_params
    @photos = RestClient::Request.execute(method: "get",
    url: "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=" + ENV['API_KEY'] + "&text=#{search}&extras=url_m&format=json&nojsoncallback=1")
    render json: @photos
  end

  private
    def search_params
      params.require(:query)
    end
end
