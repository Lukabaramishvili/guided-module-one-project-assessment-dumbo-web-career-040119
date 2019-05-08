class CommandLineInterface

  class CommandLineInterface

    def welcome
      puts 'Welcome'
    end

    def user_input
      gets.chomp.downcase
    end

  def login_signup
    puts "ENTER: Login OR Signup"
    rspn = gets.chomp.downcase
    if rspn == 'login'
      login
    elsif rspn == 'signup'
      signup
    else
      puts "Please Login Or Signup"
      login_signup
    end
  end

    def login
      puts "Please enter your username"
      rspn = gets.chomp.capitalize
      user = User.find_by(username: rspn)
      # binding.pry
      if user == nil
        puts "No user by that name!"
        puts "Would you like to create new user?(y/n)"
        answer = gets.chomp.downcase
        if answer == 'y'
          signup
        elsif answer == 'n'
          login
        else
          login_signup
        end
      else
        getUserMood(user)
      end
    end

    def signup
      puts "Please create your username"
      input = gets.chomp.capitalize
      user =  User.create(username: input)
      getUserMood(user)
    end

    def getUserMood(user)
      system("clear")
      prompt = TTY::Prompt.new
      input = prompt.select("Welcome! What is your mood today?") do |menu|
      menu.choice "1. Happy", -> {option_mood(user,"Happy")}
      menu.choice "2. Sad", -> {option_mood(user,"Happy")}
      menu.choice "3. Relaxed", -> {option_mood(user,"Happy")}
      menu.choice "4. BACK", -> {option_mood(user,"Happy")}
      menu.choice "5. EXIT", -> {option_mood(user,"Happy")}
    end

       if input == 1
         # option_happy(user)
         option_mood("Happy")
       elsif input == 2
         # option_sad(user)
         option_mood("Sad")
       elsif input == 3
         # option_relaxed(user)
         option_mood("Relaxed")
       elsif input == 4
         login_signup
       elsif input == 5
         puts "Goodbye"
       else
         login_signup
      end
    end

    def option_mood(user, mood_arg)
      mood_vr = Mood.find_by(mood: "#{mood_arg}")
      if mood_vr == nil
        puts "*******************************************"
        puts "There are no #{mood_arg} Songs! Returning to Menu"
        puts "********************************************"
        sleep 4
          getUserMood(user)
      end
      create_or_view(user, mood_arg)
    end

    # def option_happy(user)
    #   happy_m = Mood.find_by(mood: "Happy")
    #   # binding.pry
    #     if happy_m == nil
    #       puts "*******************************************"
    #       puts "There are no Happy Songs! Returning to Menu"
    #       puts "********************************************"
    #       sleep 4
    #         getUserMood(user)
    #     end
    #     create_or_view(happy_m, user)
    # end
    #
    # def option_sad(user)
    #   sad_m = Mood.find_by(mood: "Sad")
    #   if sad_m == nil
    #     puts "************************************************"
    #     puts "There are no Sad Songs! Returning to Main Menu!"
    #     puts "************************************************"
    #     sleep 4
    #     getUserMood(user)
    #   end
    #   create_or_view(sad_m, user)
    # end
    #
    # def option_relaxed(user)
    #   relaxed_m = Mood.find_by(mood: "Relaxed")
    #   if relaxed_m == nil
    #     puts puts "****************************************"
    #     puts "There are no Relaxed Songs! Returning to Menu"
    #     puts "*********************************************"
    #     sleep 4
    #     getUserMood(user)
    #   end
    #   create_or_view(relaxed_m, user)
    # end

    def create_or_view(user, mood_arg)
      system("clear")
      prompt = TTY::Prompt.new
      selected = prompt.select("Choose Options:") do |menu|
        menu.choice "1. ADD NEW SONG", 1
        menu.choice "2. VIEW EXISTING SONGS", 2
        menu.choice "3. DELETE EXISTING SONGS", 3
        menu.choice "4. UPDATE SONG MOOD", 4
        menu.choice "5. BACK", 5
      end

      if selected == 1
        enter_title = prompt.ask('Enter Song Title:', required: true, default: ENV['Song'])
        enter_artist = prompt.ask('Enter Artist Name:', required: true, default: ENV['Song'])
        puts Song.create_new_song(mood_arg, enter_title, enter_artist, user)
        system('clear')
        puts "Song was Added. Returning to Main Menu"
        user.reload
        sleep 4
        # binding.pry
        create_or_view(mood_arg, user)

      elsif selected == 2
         # binding.pry
          match = user.songs.select do |s|
            # binding.pry
            s.mood.mood == mood_arg
          end
           match.map do |s|
            puts s.title
          end
          prompt = TTY::Prompt.new
          back = prompt.select("These are all your Songs for this mood!") do |back|
          back.choice "BACK",1
          end
          if back == 1
            create_or_view(mood_arg, user)
          end

      elsif selected == 3
        puts "These are the songs you can delete:"
        match = user.songs.select do |s| #songs instance. accessing songs through user instance.(def user)
          s.mood.mood == mood_arg
        end
        if match.length == 0
          puts "********************************"
          puts "List is Empty! Returning to Menu"
          puts "********************************"
          sleep 4
          create_or_view(mood_arg, user)
        end
         match.map do |s|
           # binding.pry
          list = s.title
          puts list
        end
        puts "***********************************"
        puts "Type the name of a song to delete:"
        puts "***********************************"
        u_input = prompt.ask('Enter Song Title:', required: true)
        delete_title = u_input
        deleting = user.songs.find_by(title: delete_title)
          if deleting != nil
          deleting.destroy
          puts "Song was deleted! Returning to Main Menu"
            sleep 3
            user.reload
          create_or_view(mood_arg, user)
       else
         # binding.pry
         puts "Input does not Match the Song Title! Returning to Menu"
         sleep 4
         create_or_view(mood_arg, user)
       end
      elsif selected == 4
        puts "****************************************"
        puts "Change song mood by typing in song name:"
        puts "****************************************"
        match = user.songs.select do |s| #songs instance. accessing songs through user instance.(def user)
          s.mood.mood == mood_arg
        end
        if match.length == 0
          puts "List is Empty! Returning to Menu"
          sleep 4
          create_or_view(mood_arg, user)
        end
         match.map do |s|
          puts s.title
        end
        puts "------------------------------"
        song_name = gets.chomp
        get_title = Song.find_by(title: song_name) #get the song instance
        puts "Enter a new mood: Happy, Sad, or Relaxed:"
        new_mood = gets.chomp
        if new_mood == "Happy" || new_mood == "Sad" || new_mood == "Relaxed"
          update_song_mood = Mood.find_by(mood: new_mood) #get instance of a mood that user chose.
          get_title.update(mood_id: update_song_mood.id)
          # binding.pry
          puts "Mood was Updated to #{new_mood}! Returning to Main Menu"
          sleep 4
          user.reload
          create_or_view(mood_arg, user)
        else
          puts "********************************************************"
          puts "Input must be Happy, Sad, or Relaxed! Returning to Menu"
          puts "********************************************************"
          sleep 4
          create_or_view(mood_arg, user)
        end
      elsif selected == 5
        getUserMood(user)
      end
    end

    def run
      welcome
      login_signup
    end

  end


end
