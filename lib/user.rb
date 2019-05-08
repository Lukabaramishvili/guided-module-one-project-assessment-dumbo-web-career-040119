class User < ActiveRecord::Base
has_many :songs
has_many :moods, through: :songs
end

def self.create_new_user(username)
  self.create(username: username)
end
