require_relative '../lib/flexo.rb'

play_proc = Proc.new{puts 'i am the executed :play method.'}
pause_proc = Proc.new{puts 'i am the executed :pause method.'}

h1 = { :play => play_proc, :pause => pause_proc }

my_flexo_obj = Flexo.new({:velocity=>127, :midi_channel=>10}, h1)

#p my_flexo_obj.inspect

my_flexo_obj.execute(:play)
my_flexo_obj.execute(:pause)
