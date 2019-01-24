class Api::V1::SearchPhotosController < ApplicationController
  def index
    search = search_params
    @photos = Photo.search_photos(search)
    render json: @photos
  end

  private
    def search_params
      params.require(:query)
    end
end
