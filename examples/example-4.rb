require_relative '../lib/flexo.rb'

h1 = { :play => true, :pause => false }

my_flexo_obj = Flexo.new({:velocity=>127, :midi_channel=>10}, h1)

p my_flexo_obj.inspect
p "before method mods.."
p my_flexo_obj.get_method(:play)
p my_flexo_obj.get_method(:pause)
p "after method mods.."
p my_flexo_obj.set_method(:play, false)
p my_flexo_obj.set_method(:pause, true)
