#Part 2 
class CartesianProduct
  include Enumerable
  
  def initialize(arr1, arr2)
    @arr1, @arr2 = arr1, arr2
    cartProd()  #calculate the cartisian product
  end
  
  #method to find the resulting array
  def cartProd
     @items = []
      @arr1.each{ |a|
          @arr2.each{ |b|
           item = [] << a << b
           @items << item
          }
        }
  end
  
  #yielding the result
  def each
     @items.each{ |i| yield i}
  end
  
end

c = CartesianProduct.new([:a,:b], [4,5])
c.each { |elt| puts elt.inspect }
# [:a, 4]
# [:a, 5]
# [:b, 4]
# [:b, 5]

c = CartesianProduct.new([:a,:b], [])
c.each { |elt| puts elt.inspect }
# (nothing printed since Cartesian product
# of anything with an empty collection is empty)