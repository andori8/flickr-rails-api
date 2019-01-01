class CreatePhoto < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.text :url
      t.text :title
      t.integer :photo_id
      t.integer :owner_id
    end
  end
end
