def substrings(string, dictionary)
  result = {}

  dictionary.each { |entry|
    pattern = Regexp.new(entry, true)

    if !string.match?(pattern)
      next
    end

    result[entry] = 0

    string.split(' ').each { |word|
      if word.match?(pattern)
        result[entry] = result[entry] + 1
      end
    }
  }

  return result
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

puts substrings("below", dictionary)

puts substrings("Howdy partner, sit down! How's it going?", dictionary)