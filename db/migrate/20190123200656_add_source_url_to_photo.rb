class AddSourceUrlToPhoto < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :flickr_url, :text
  end
end
