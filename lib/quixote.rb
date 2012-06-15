$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require "quixote/version"

class Quixote
  attr_accessor :min, :max, :range_by, :last

  def initialize(options={})
    defaults = {
      :max => 100,
      :min => 0,
      :range_by => 10
    }

    defaults.merge(options).each do |key, value|
      send("#{key}=", value)
    end

    @last = rand(max+1)
  end

  def next
    if last == max
      decrement
    elsif last == min || (rand < 0.5)
      increment
    else
      decrement
    end
    last
  end

  private

  def increment
    @last += rand(range_by+1)
    @last = max if last > max
  end

  def decrement
    @last -= rand(range_by+1)
    @last = min if last < min
  end
end
