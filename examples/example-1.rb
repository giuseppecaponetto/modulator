require_relative '../lib/pattern-builder.rb'



pattern = PatternBuilder::Pattern.new "Hip Hop", "A groovy pattern suited for 85 bpm", 16 do 
  channel "kicks" do 
    
  end
  channel "snares"do
    
  end
  channel "conhas" do
    
  end
end

puts pattern.to_custom_string