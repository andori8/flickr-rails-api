class Photo < ApplicationRecord
  validates_presence_of :photo_id, :owner, :secret, :farm, :server, :title, :url

  def self.api_to_database
    @photos = RestClient::Request.execute(method: "get",
      url: "https://api.flickr.com/services/rest/?method=flickr.photos.getRecent&api_key=" + ENV['API_KEY'] + "&extras=url_m&format=json&nojsoncallback=1")
    @info = JSON.parse(@photos)["photos"]["photo"]
    @info.each do |photo|
      check_photo = self.find_by(photo_id: photo["id"])
      if !check_photo
        new_photo = self.new do |key|
          key.photo_id = photo["id"]
          key.title = photo["title"]
          key.url = photo["url_m"]
          key.owner = photo["owner"]
          key.server = photo["server"]
          key.farm = photo["farm"]
          key.secret = photo["secret"]
        end
        new_photo.save
      end
    end
  end
end
