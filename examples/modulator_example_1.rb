require_relative "../lib/modulator.rb"

class A
  include Modulator
  def initialize
    @var=1
  end
  def method_of_class_a
    puts "method_of_class_a was called."
  end
end

class B < A
  def initialize
    @var=1
  end
  def method_of_class_b
    puts "method_of_class_b was called."
  end
end

a = A.new
a.example_module_method
b = B.new
b.example_module_method
