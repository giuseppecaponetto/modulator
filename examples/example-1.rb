require_relative '../lib/pattern-builder.rb'



pattern = PatternBuilder::Pattern.new "Hip Hop", "A groovy pattern suited for 85 bpm", 16 do 
  channel "kicks" do 
    fill_with 1
  end
  channel "snares"do
  fill_with 2
  end
end

puts pattern.to_custom_string