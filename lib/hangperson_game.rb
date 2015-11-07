class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end
  
  def initialize(word)
    @word = word
    @guesses = ""
    @wrong_guesses = ""
  end

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end

  def guess(letter)
    letter.downcase!

    validate(letter)

    letter.downcase!
    if @guesses.include?(letter) || @wrong_guesses.include?(letter)
      return false
    end

    if @word.include?(letter)
      @guesses += letter
    else
      @wrong_guesses += letter
    end
    # return true if guess was successful.
    return true
  end

  def validate(letter)
    raise ArgumentError unless (letter =~ /\w+/) != nil
  end

  attr_accessor :word
  attr_accessor :guesses
  attr_accessor :wrong_guesses
end
