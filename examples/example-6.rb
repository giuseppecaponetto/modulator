require_relative '../lib/flexo.rb'

my_flexo_obj = Flexo.new("Bomb", {:velocity=>127, :midi_channel=>10}, {:shout => Proc.new{puts 'ahhhhhhh!!!'}})

p my_flexo_obj
