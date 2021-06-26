require_relative 'player.rb'

class Game 
  attr_reader :word
  attr_accessor :guess_left 
  attr_accessor :previous_guesses
  attr_accessor :result

	def initialize 
		dict =[]
		File.open("5desk.txt").each do |word|
      word = word[0..-3].downcase
      if word.length < 12 && word.length > 5 then dict.push(word) end
    end
    @word = dict[rand(dict.length)]
    @guess_left = 10
    @result = Array.new(word.length, "_")
    @previous_guesses = []
    p word
	end

  def get_input
    puts "Please enter a valid character"
    input = gets.chomp
    while (input.length != 1 || input.match?(/[^a-z]/) || previous_guesses.include?(input) ) do 
      puts "Please enter a valid character"
      input = gets.chomp
    end
    previous_guesses.push(input)
    update_results(input)
    return input
  end

  def update_results(input)
    arr = word.split("")
    arr.each_with_index do |i,index| 
      if input == i then result[index] = input end
    end
    p previous_guesses
    p result.join
  end
end 