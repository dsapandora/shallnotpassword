require 'raspell'
require 'twitter'

config = {
consumer_key:    ENV["YOUR_CONSUMER_KEY"],
consumer_secret: ENV["YOUR_CONSUMER_SECRET"],
access_token: ENV["ACCESS_TOKEN"],
access_token_secret: ENV["ACCESS_TOKEN_SECRET"]

}
@client = Twitter::REST::Client.new(config)

def get_password_strenght(password, tweet_user)
  reduced_phrase = reduce_password(password.downcase)
  count = representative_character_count(reduced_phrase)
  strenght = count * reduced_phrase.size
  message = ""
  if strenght <= 10
    message = 'The pasword is Unacceptable, you should retry another one.'
  elsif strenght < 50
      # TODO Hard the password to be strong
      message = 'The pasword is Week, we should reply you a new one when the feature is ready.'
  else
    message = 'Congratulations!!! your password is Strong.'
  end
  message = "@#{tweet_user} #{message}"
  @client.update(message)
  print message
end

def reduce_password(password)
  # Prepare raspell check
  # Replace all non letter to white space
  speller = Aspell.new("en_US")
  speller.suggestion_mode = Aspell::NORMAL
  password_to_check = password.gsub(/[^a-z ]/i, ' ')
  word_lists = password_to_check.split
  words_to_replace = []
  word_lists.each do |word|
    words_to_replace.push(word) if speller.check(word)
  end
  words_to_replace.each do |word|
    password = password.gsub(word, word[0])
  end
  password
end

def representative_character_count(reduced_phrase)
  representative_character_count = 0
  representative_character_count += 1 if reduced_phrase =~ Regexp.new("[0-9]+").freeze
  representative_character_count += 1 if reduced_phrase =~ Regexp.new("[a-z]+").freeze
  representative_character_count += 1 if reduced_phrase =~ Regexp.new("[\t\n ]+").freeze
  representative_character_count += 1 if reduced_phrase =~ Regexp.new("[[:punct:]]+").freeze
  representative_character_count
end



def lookup_tweet_mention_the_user
  @client.search("to:YouShallNotPassword", result_type: "recent").take(3).collect do |tweet|
    get_password_strenght(tweet.text, tweet.user.screen_name)
  end
end


lookup_tweet_mention_the_user
