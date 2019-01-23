class CreatePhoto < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.text :url
      t.text :title
      t.integer :server, limit: 8
      t.integer :farm, limit: 8
      t.integer :secret, limit: 8
      t.integer :photo_id, limit: 8
      t.text :owner
    end
  end
end
