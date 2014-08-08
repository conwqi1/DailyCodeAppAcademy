class Hangman
  attr_reader :secret_word, :guessed_word
  
  def initialize(guessing_player, checking_player)
    @guessing_player = guessing_player
    @checking_player = checking_player
    # @guessing_player.register_game(self)
    # @checking_player.register_game(self)
    @guessed_word = ""
  end
  
  def print_status
    puts "Secret word: #{@guessed_word}"
    print "             "
    puts @guessed_word.length.times.map {|x| (x + 1).to_s}.join
  end
  
  def modify_guessed_word(letter, positions)
    positions.each do |char_index|
       @guessed_word[char_index - 1] = letter
    end
  end

  
  def play
    @checking_player.pick_secret_word
    length = @checking_player.secret_word_length
    @guessing_player.receive_secret_length(length)
    while !@guessing_player.won? do
        guess = @guessing_player.guess
        p "Guess = #{guess}"
        correct_guesses = @checking_player.check_guess(guess)
        p "correct_guesses = #{correct_guesses}"
        @guessing_player.handle_guess_response(guess, correct_guesses)
    end
   # @checking_player.pick_secret_word
   #  @secret_word = "*" * @secret_word if @secret_word.class == Fixnum
   #  @guessed_word = "_" * @secret_word.length
   #
   #  # Infinite game for now
   #  while !won?
   #    print_status
   #    guess = @guessing_player.guess
   #    if @checking_player.check_guess(guess)
   #      correct_indexes = @checking_player.handle_guess_response(guess)
   #      modify_guessed_word(guess, correct_indexes)
   #    end
   #  end
   #  puts "Congratulations, you won the game!"
   #  puts @guessed_word
  end
end

class HumanPlayer
  def initialize(name)
    @name = name
    @secret_word_length = 0
    @guessed_word = ''
  end
  
  def won?
    @guessed_word.length != 0 && !@guessed_word.include?("_")
  end
  
  def pick_secret_word
    print "Think of a word, and give its length: "
    @secret_word_length = gets.chromp.to_i
  end
  
  def receive_secret_length(length)
    @secret_word_length = length
    @guessed_word = "_" * length
  end
  
  def guess
    print "Pick a random letter: "
    gets.chomp
  end
  
  def check_guess(letter)
    puts "Please enter positive numbers for the position of '#{letter}'."
    print "Enter 'false' if '#{letter}' is not in the word: "
    response = gets.chomp
    response.chomp.split(',').map { |el| el.to_i } if response > 0
  end

  def handle_guess_response(letter, index_array)
    p "HANDLE_GUESS_RESPONSE_INPUT = #{letter}, #{index_array}"
      index_array.each { |el| @guessed_word[el] = letter }
  end
end

class ComputerPlayer
  attr_reader :secret_word_length
  
  def initialize(name)
    @name = name
    @invalid_letters = []
    @secret_word = ""
    @secret_word_length = 0
  end
  
  def pick_secret_word
     dictionary = File.readlines("dictionary.txt").map{ |el| el.chomp }
     @secret_word = dictionary.sample
     puts "MY SECRET WORD IS #{@secret_word}"
     @secret_word
  end

  def receive_secret_length(length)
    @secret_word_length = length
  end
=begin
  def words_filtered_by_length(words)
     words.select { |el| el.length == @game.secret_word.length }
  end
  
  def word_include_letters?(word)
      
  end
  
  def words_filtered_by_possibility(words)
    regex = @game.guessed_word.split("").map {|el| el == "_" ? "." : el}.join
    words.select do |el| 
       /#{regex}/.match(el) != nil && el.to_a.each {|element| } 
    end
  end
  
  def find_most_frequent_letter(words)
    p words
    letter_count = Hash.new {0}
    words.join("").split("").each do |char|
      letter_count[char] += 1 unless @invalid_letters.include? char
    end
    letter_count.max_by{ |k,v| v }.first
  end  
  
  def guess
    dictionary = File.readlines("dictionary.txt").map{ |el| el.chomp }
    words_filtered_by_length = words_filtered_by_length(dictionary)
    letter = ''
    if words_filtered_by_length.count >= 1
      possible_words = words_filtered_by_possibility(words_filtered_by_length)
      if possible_words.count >= 1
        letter = find_most_frequent_letter(possible_words)
      else
        letter = ('a'..'z').rand
      end
    else
      letter = ('a'..'z').rand
    end
  
    unless @invalid_letters.include?(letter)
      @invalid_letters << letter
      print "Pick a random letter: #{letter}"
      letter
    else
      guess
    end
  end
=end
  def check_guess(letter)
    index_arr=[]
    if @secret_word.include?(letter)
      @secret_word.split("").each_with_index do |el, index|
        index_arr << index if el == letter  
      end
    end
    index_arr
  end
  
  def handle_guess_response(letter)
    indexes = []
    @game.secret_word.split("").each_with_index do |char, index|
      indexes << (index.to_i + 1) if char == letter
    end
    indexes
  end
  
end