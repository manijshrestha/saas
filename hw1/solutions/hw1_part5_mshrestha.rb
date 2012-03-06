#Part - 5
#Meta-programming
class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s # make sure it's a string
    attr_reader attr_name # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter

    class_eval %Q{
                  def #{attr_name}
                    @#{attr_name}
                  end
                  
                  def #{attr_name}=(value)
                    #{attr_name}_history << value
                    @#{attr_name} = value
                  end
                  
                  def #{attr_name}_history
                    @history = {"#{attr_name}" =>[nil]} if !defined? @history
                    @history.has_key?("#{attr_name}")? @history["#{attr_name}"]: @history["#{attr_name}"]=[nil]
                  end
                 }
  end
end

#Test Class Foo
class Foo
  attr_accessor_with_history :bar
  attr_accessor_with_history :name
end

 # f = Foo.new
 # f.bar = 1
 # f.bar = 2
 # print f.bar
# # print f.bar_history # => if your code works, should be [nil,1,2]
# # 
# f = Foo.new
# f.name = "Jon"
# f.name = "Manij"
# f.bar = 4
# print f.bar
# print f.name
# print f.bar_history # => should be [nil, 4]
# print f.name_history # => should be ["Jon", "Manij"]
