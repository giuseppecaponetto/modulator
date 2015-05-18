

require_relative '../lib/flexo.rb'

my_flexo_obj = Flexo.new({:velocity=>127, :midi_channel=>10})

my_flexo_obj[:velocity]=99

p my_flexo_obj.inspect

