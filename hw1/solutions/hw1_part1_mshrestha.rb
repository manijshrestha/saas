#Part - a
#Method that determines whether a given word or phrase is a palindrome
def palindrome?(string)
 trimmedString = string.downcase.gsub(/[^a-z]/, "") #trimm the string to capture only a-z replacing none alphanumic chars
 trimmedString.eql? trimmedString.reverse #verifying if the resulting string is a palindrome or not
end

#Tests
#puts palindrome?("A man, a plan, a canal -- Panama") #=> true
#puts palindrome?("Madam, I'm Adam!") # => true
#puts palindrome?("Abracadabra") # => false

#Part - b
#Given a string of input, return a hash whose keys are words in the string and
#whose values are the number of times each word appears
def count_words(string)
  hash = {} #hash to store the count
  string.downcase.scan(/\w+/i).each { |w| 
     hash.has_key?(w) ?hash[w] = hash[w] + 1 :hash[w] = 1
     }
  return hash
end

#Tests
#puts count_words("A man, a plan, a canal -- Panama") # => {'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1,'plan' => 1}
#puts count_words "Doo bee doo bee doo" # => {'doo' => 3, 'bee' =>2}