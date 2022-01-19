class CLI 

  attr_accessor :user, :current_char

  # Here we have all of your command line interface user functionality
  def welcome
    puts "Welcome to the DND Character Creator!"
    puts ""
  end

  def start
    welcome
    puts "What's your name?"
    input_name = gets.strip

    if input_name == "exit"
      exit_program
    end
    # p "THIS IS THE INPUT: #{input_name}"
    # Find or create a new user from their input
    # TODO Fix match case
    self.user = User.find_or_create_by(name: input_name)
    #. !!user ? continue onto char creation : Send them to create a new user
    # Then have the user create a character
    character_menu
    # Then have the user create equipment for their character

  end

  def char_prompt
    puts "Hello, #{self.user.name}!"
    puts "(1) Would you like to create a new character?"
    puts "(2) Would you like to see the characters you've created?"
    puts "(0) Would you like to logout?"
    puts "(exit) Exits Program"
  end

  def character_menu
    char_prompt
    input = gets.strip
    if input == "1"
      # go to new character "page"
      character_creator      
    elsif input == "2"
      # go to list of current charcters
      display_characters
      equip_prompt
      get_char
    elsif input == "0"
      # Loop back to start
      start
    elsif input == "exit"
      exit_program
      # break
    else 
      puts "wrong"
      # Recursion
    end
    character_menu
  end

  def character_creator
    # first create a step by step menu input for all of our attributes
    stats_arr = create_weighted_array(Array(1..20))

    puts "What's your character's name?: "
    char_name = gets.strip

    # Rand our stats
    char_params = {
      name: char_name,
      str: stats_arr.sample, 
      int: stats_arr.sample, 
      wis: stats_arr.sample, 
      dex: stats_arr.sample, 
      chr: stats_arr.sample, 
      lck: stats_arr.sample, 
      vit: stats_arr.sample, 
      }
    # create a new instance of Character off of our @user
    new_char = @user.characters.create(char_params)
    display_character(new_char)

  end
  
  def display_characters
    # iterate through the current user.characters and display for a human
    puts "Your Characters:"
    self.user.characters.map.with_index(1) do |char, idx|
      # puts "(#{idx})"
      display_character(char, idx)
    end
  end
  
  def display_character(char, idx=0)
    puts ""
    puts "(#{idx}) #{char.name}"
    puts ""
    puts "Vitality: \t#{char.vit}"
    puts "Strength: \t#{char.str}"
    puts "Dexterity: \t#{char.dex}"
    puts "Intelligence: \t#{char.int}"
    puts "Wisdom: \t#{char.wis}"
    puts "Charisma: \t#{char.chr}"
    puts "Luck: \t\t#{char.lck}"
    puts ""
  end

  def equip_prompt
    puts "Type the number of the character you'd like to see"
    puts "Or type (0) to go back to the main menu"
  end

  def get_char
    input = gets.strip
    # if they type a char number, then show the equip details of that char
    # else send back to main menu
    if input == "0"
      character_menu
    else 
      char_index = input.to_i - 1
      # if char_index is > 0
      @current_char = @user.characters[char_index]
      equip_menu
    end

    # ask if they'd like to add or see the equipment



  end
  
  def equip_menu
    puts "(1) See Equipment on Char"
    puts "(2) Add new Equipment"
    puts "(0) Go back to main menu"
    puts ""
    input = gets.strip

    if input == "1"
      display_all_equipment
    elsif input == "2"
      create_equip
    else
      character_menu
    end
  end

  def display_all_equipment
    @current_char.equipment.map.with_index(1) do |eq, idx|
      display_equipment(eq, idx)
    end
  end

  def display_equipment(equipment, idx=0)
    puts "(#{idx})\t#{equipment.item_name}"
    stat_str = equipment.positive ? "+#{equipment.stat}" : "-#{equipment.stat}"
    puts "Stats:\t#{stat_str}"
  end
  
  def create_equip
    puts "What's your equipment name?"
    input_item_name = gets.strip
    equip_params = {
      item_name: input_item_name,
      stat: equip_stats,
      positive: is_positive
    }
    equipment = @current_char.equipment.create(equip_params)
    display_equipment(equipment)
  end

  def exit_program
    puts "Thanks for playing!"
    exit
  end

end
