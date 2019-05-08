class Song < ActiveRecord::Base
  belongs_to :user
  belongs_to :mood

<<<<<<< HEAD
  def self.createNewSong(mood, song_name, artist_name, user)
      self.create(title: song_name, user_id: User.find_by(username: "Luka").id, mood_id: mood.id, artist_name: artist_name)
  end

  def self.display
    self.all.map do |t|
      t.title
      # binding.pry
    end
  end
=======
  def self.create_new_song(mood, song_name, artist_name, user)
      self.create(title: song_name, user_id: user.id, mood_id: mood.id, artist_name: artist_name)
  end

  # def self.display
  #   self.all.select do |s|
  #     binding.pry
  #     s.mood == mood_arg.mood
  #   end
  # end


  # def mood_s
  #   self.all.moods
  #   binding.pry
  # end


  # def display_songs
  #   Song.all.select do |song|
  #     # binding.pry
  #     song.user == self
  #   end
  # end
>>>>>>> 62ec3fe51711c97f689be536dd63c63e4c1b0864


end
