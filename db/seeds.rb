User.destroy_all
Song.destroy_all
Mood.destroy_all

luka = User.create(username: "Luka")
jim = User.create(username: "Jim")
jack = User.create(username: "Jack")

mood_h = Mood.create(mood: "Happy")
mood_s = Mood.create(mood: "Sad")
mood_r = Mood.create(mood: "Relaxed")

#happy moods:
Song.create(title:"Unbelievable", user_id: luka.id, mood_id: mood_h.id, artist_name: "EMF")
Song.create(title: "Escapade", user_id: luka.id, mood_id: mood_h.id, artist_name: "Janet Jackson")
Song.create(title: "Fantasy", user_id: luka.id, mood_id: mood_h.id, artist_name: "Mariah Carey")
Song.create(title: "Alone", user_id: luka.id, mood_id: mood_h.id, artist_name: "Heart")

#sad moods:
Song.create(title: "Jump", user_id: jim.id, mood_id: mood_s.id, artist_name: "Van Halen")
Song.create(title: "Lollipop", user_id: jim.id, mood_id: mood_s.id, artist_name: "Lil Wayne")
Song.create(title: "Firework", user_id: jim.id, mood_id: mood_s.id, artist_name: "Katy Perry ")
Song.create(title: "Vogue", user_id: jim.id, mood_id: mood_s.id, artist_name: "SSS")
Song.create(title: "Waterfalls", user_id: jim.id, mood_id: mood_s.id, artist_name: "TLC")

#relaxed moods:
Song.create(title: "Goodies", user_id: jack.id, mood_id: mood_s.id, artist_name: "Ciara")
Song.create(title: "Radioactive", user_id: jim.id, mood_id: mood_s.id, artist_name: "Imagine Dragons")
Song.create(title: "Irreplaceable", user_id: jim.id, mood_id: mood_s.id, artist_name: "Beyoncé")
Song.create(title: "Breathe", user_id: jim.id, mood_id: mood_s.id, artist_name: "Faith")
Song.create(title: "Venus", user_id: jim.id, mood_id: mood_s.id, artist_name: "Frankie Avalon")



# binding.pry
