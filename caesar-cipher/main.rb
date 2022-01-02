# Challenge: https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-programming/lessons/caesar-cipher

ALPHABET = ('a'..'z').to_a

def get_alphabet(shift)
  before_shift = ALPHABET.slice(0, shift)
  after_shift = ALPHABET.slice(shift, ALPHABET.length)

  after_shift + before_shift
end

def is_char_upper(char)
  return char == char.upcase
end

def get_char_in_alphabet(char, alphabet)
  char_index = ALPHABET.index(char)
  
  alphabet.at(char_index)
end

def caesar_cipher(value, shift)
  shift_alphabet = get_alphabet(shift)
  result = ''
  regex = Regexp.new(/[a-zA-Z]/)

  value.split('').each { |char|
    if !char.match?(regex)
      result = result + char
      next
    end

    char_upper = is_char_upper(char)
    char_value = char_upper ? char.downcase : char
    new_char_value = get_char_in_alphabet(char_value, shift_alphabet)

    result = result + (char_upper ? new_char_value.upcase : new_char_value)
  }

  result
end

puts caesar_cipher("What a string!", 5) # Bmfy f xywnsl!