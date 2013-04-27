class AddVoteToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :vote, :string
  end
end
