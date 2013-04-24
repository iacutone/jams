class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.string :artist
      t.float :duration
      t.string :album
      t.string :url

      t.timestamps
    end
  end
end
