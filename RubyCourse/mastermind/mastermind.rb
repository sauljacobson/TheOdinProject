class SecretMaker
  attr_accessor :secret, :hint

  def initialize() 
    @secret = []
    @hint = [] 
  end 

  def secret_guessed?(guess)
    @secret == guess
  end 

  def make_secret() 
    codes = ["blue", "yellow", "green", "purple"]
    4.times {@secret.push(codes.sample)}
  end 

  def give_hint(guess)
    guess.each_with_index do |color, index|
      if @secret.include? color and @secret[index] == color
        hint.push("red")
      elsif @secret.include? color and @secret[index] != color 
        hint.push("white")
      end
    end
    @hint  
  end
end

class Player
  attr_accessor :guess 
  
  def initialize() 
    @guess = [] 
  end

  def guess_secret()
    colors = ["blue", "yellow", "green", "purple"] 
    4.times do |i|
      while true
        puts "1. Blue\n2. Yellow\n3. Green\n4. Purple" 
        print "Select Color #{i+1}: " 
        color = gets.chomp.to_i - 1
        
        if color < 0 or color > 3 
          next
        
        end 
        
        @guess.push(colors[color])
        
        break 
      
      end
    end
    @guess
  end
end 

class Mastermind 
  attr_accessor :guesses, :hints, :attempts 
  
  def initialize() 
    @round = 1 
    @guesses = initialize_guesses() 
    @hints = initialize_hints()
  end

  def run()
    player = Player.new
    secret_maker = SecretMaker.new 
    secret_maker.make_secret()  
    
    while @round < 13  do
      display_status()
      puts "Attempts: #{@attempts}"
      player.guess_secret() 
      @guesses[@round-1] = player.guess;
      system("clear") 
      
      if secret_maker.secret_guessed?(player.guess) 
        system("clear") 
        display_status()
        puts "Secret Guessed"
        break 
      end

      secret_maker.give_hint(player.guess)
      
      @hints[@round-1] = secret_maker.hint
      @round += 1 
      
      secret_maker.hint=[] 
      player.guess=[] 

      if @round == 13
        system("clear")
        display_status()
        puts "You lose! The secret was #{secret_maker.secret}" 

      end
    end
  end 

  def initialize_guesses()
    guesses = [] 
    round_guess = []
    for row in 0...12
      for col in 0...4
        round_guess.push('-')
      end
      guesses.push(round_guess) 
      round_guess = [] 
    end

    guesses

  end

  def initialize_hints() 
    hints = [] 
    round_hints = []
    for row in 0...12 
      for col in 0...4 
        round_hints.push('-')
      end
      hints.push(round_hints)
      round_hints = []
    end 
    
    hints 
  end

  def display_status() 
    for row in 0...12 
      print "[ "
      for guess in @guesses[row]
        if guess == "green"
          print "\e[32m" 
        elsif guess == "yellow"
          print "\e[33m" 
        elsif guess == "blue"
          print "\e[34m"
        elsif guess == "purple" 
          print "\e[35m"
        end 
        print "#{guess}\e[0m "
      end
      print "] " 

      print "[ " 
      for hint in @hints[row] 
        if hint == "red" 
          print "\e[31m"
        end 
        print "#{hint}\e[0m "
      end
      print "]" 
      puts 
    end 
  end 
end 

mastermind = Mastermind.new() 
mastermind.run()

