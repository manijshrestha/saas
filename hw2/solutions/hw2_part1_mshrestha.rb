# metaprogramming to the rescue!
#a
class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1}
  def method_missing(method_id)
    singular_currency = nomalizeCurrency method_id
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end
#instance method to convert into differnt currencies
  def in (currency)
    self * (1/@@currencies[nomalizeCurrency currency])
  end
  
  def nomalizeCurrency (currency)
    currency.to_s.gsub(/s$/, '')
  end
end

#Tests
#puts 1.rupee.in(:yen)
#puts 1.dollar.in(:rupees)
#puts 45.rupees.in(:dollars)
#puts 5.rupees.in(:yen)

#b
 class String
    def palindrome?
      trimmedString = self.downcase.gsub(/[^a-z]/, "") #trimm the string to capture only a-z replacing none alphanumic chars
      trimmedString.eql? trimmedString.reverse #verifying if the resulting string is a palindrome or not
    end
  end

#Tests
#puts "foo".palindrome?
#puts "foof".palindrome?

#c
module Enumerable
  def palindrome?
       arr = self.to_a
       arr.eql?arr.reverse      
  end
end

class ValidPalindromeTest
   include Enumerable
  
end

#puts "1", [1,[2,1],5,7].palindrome?
#puts "2", [1,2,3,2,1].palindrome?
#puts "3", {"hello"=> "world"}.palindrome?  #should not error
#puts "4", ValidPalindromeTest.new(1,9).palindrome?  #should be true
#puts "5",  (1..2).palindrome? #Should be false
