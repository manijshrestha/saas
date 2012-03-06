#Part - 3
#Anagram algorithm
def combine_anagrams(words)
  hash = {}
  words.each {|word|
    key = word.downcase.split(//).sort.join #create a key based on the sorting of the chars in string
    hash.has_key?(key) ?hash[key] = hash[key] << word : hash[key] = [word]
  }
  hash.values
end

#Tests
#print ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream']
#print combine_anagrams ['Cars', 'For', 'Potatoes', 'racs', 'four','scar', 'creams', 'scream']
# => output: [["cars", "racs", "scar"], ["four"], ["for"], ["potatoes"], ["creams", "scream"]]