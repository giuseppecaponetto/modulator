require_relative '../lib/flexo.rb'

grades = { :lane => 10, :steps => 6 }


my_flexo_obj = Flexo.new(grades)

p my_flexo_obj.lane
p my_flexo_obj.lane=30
p my_flexo_obj.lane
