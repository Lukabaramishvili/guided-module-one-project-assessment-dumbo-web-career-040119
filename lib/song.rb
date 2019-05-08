class Song < ActiveRecord::Base
  belongs_to :user
  belongs_to :mood

  def self.createNewSong(mood, song_name, artist_name, user)
      self.create(title: song_name, user_id: User.find_by(username: "Luka").id, mood_id: mood.id, artist_name: artist_name)
  end

  def self.display
    self.all.map do |t|
      t.title
      # binding.pry
    end
  end


end
