class Photo < ApplicationRecord
  validates_presence_of :photo_id, :owner, :secret, :farm, :server, :title, :url

  def self.pull_recent
    self.delete_all
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

  def self.pull_info(photo_id)
    @photo = RestClient::Request.execute(method: "get",
      url: "https://api.flickr.com/services/rest/?method=flickr.photos.getInfo&api_key=" + ENV['API_KEY'] + "&photo_id=#{photo_id}&format=json&nojsoncallback=1")
    single_photo = JSON.parse(@photo)["photo"]
    match_photo = self.find_by(photo_id: single_photo["id"])
    match_photo.flickr_url = single_photo["urls"]["url"][0]["_content"]
    match_photo.save
    return match_photo
  end

  def self.search_photos(search)
    self.delete_all
    @photos = RestClient::Request.execute(method: "get",
      url: "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=" + ENV['API_KEY'] + "&text=#{search}&extras=url_m&format=json&nojsoncallback=1")
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
