#Part - 4
#Dessert class with getters and setters for name and calories
class Dessert
  def initialize(name, calories)
    @name = name
    @calories = calories  
  end
  
  attr_accessor :name
  attr_accessor :calories
  
  def healthy?
    return calories < 200
  end
  
  def delicious?
    true
  end
end

#JellyBean class that has flavor
class JellyBean < Dessert
  def initialize(name, calories, flavor)
    super(name, calories)
    @flavor = flavor
  end
  
  attr_accessor :flavor
  
  #overriding delicous
  def delicious?
    !flavor.downcase.eql? "black licorice"
  end
end

#Test
# d1 = Dessert.new("Cake", 100)
# print d1.name
# print d1.healthy?
# print d1.delicious?
# 
# jb = JellyBean.new("JB1", 250, "black licorice")
# print jb.name
# print jb.delicious?
