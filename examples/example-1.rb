require_relative '../lib/flexo.rb'

my_flexo_obj = Flexo.new
my_flexo_obj.make_new_member(:size)
my_flexo_obj.size=20

p my_flexo_obj.size
