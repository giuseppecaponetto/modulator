module PatternBuilder
  
  class Channel
    attr_accessor :name, :array
    def initialize(name, steps)
      self.name = name
      self.array = Array.new(steps, nil)
    end
    
    def to_custom_string
      output = name+": "
      array.each do |element|
        output << "[#{element.to_s}]"
      end
      output 
    end
    private
    def fill_with(elem)
      array.each_index do |index|
        array[index] = elem
      end
    end
  end

  class Pattern
    attr_accessor :name, :description, :channels, :steps
    
    def initialize name, description="No description availabe", steps, &block 
      self.steps = steps
      self.name = name
      self.description = description
      self.channels = []
      instance_eval(&block)
    end
    
    def to_custom_string
      output = "Pattern name: " + name + "\n"
      output << "Description: #{description} \n"
      output << "Number of steps: " + steps.to_s + "\n"
      output << "Channel/pad number: #{channels.size} \n"
      channels.each_with_index do |index|
        output << index.to_custom_string + "\n"
      end
      output
    end
    
    private
    def channel(name, &options)
      channel = Channel.new(name, steps)
      channel.instance_eval(&options)
      channels << channel
    end
    alias_method :pad, :channel
  end
end