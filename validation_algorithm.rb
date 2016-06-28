require 'raspell'

def get_password_strenght(password)
  reduced_phrase = reduce_password(password.downcase)
  count = representative_character_count(reduced_phrase)
  strenght = count * reduced_phrase.size
  if strenght <= 10
    'Unacceptable'
  elsif strenght < 50
    'Week'
  else
    'Strong'
  end
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


print get_password_strenght(ARGV[0])
