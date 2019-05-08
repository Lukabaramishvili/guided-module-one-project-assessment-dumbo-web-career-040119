class User < ActiveRecord::Base
has_many :songs
has_many :moods, through: :songs
<<<<<<< HEAD
end

def self.create_new_user(username)
  self.create(username: username)
=======


  def self.display
    match = users.songs.select do |s|
      binding.pry
      s.mood == mood_arg.mood
    end
    
    match.map do |s|
    puts s.title
    end
  end

  # def self.signup(name)
  #
  # end

  # def display_songs
  #    self.songs.map do |song|
  #     user.songs == self
  #   end
  # end


>>>>>>> 62ec3fe51711c97f689be536dd63c63e4c1b0864
end
