class B
  
end

class A
  def self.new; Class.new(B) end
end

a = A.new
p a.class
p a.ancestors