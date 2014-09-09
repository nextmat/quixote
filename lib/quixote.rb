$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require "quixote/version"

class Quixote
  attr_accessor :min, :max, :range_by, :last, :progress

  def initialize(options={})
    start = options.delete(:start)

    defaults = {
      max: 100,
      min: 0,
      range_by: 10
    }

    defaults.merge(options).each do |key, value|
      send("#{key}=", value)
    end

    @last = start || random_start_point
  end

  def next
    if progress
      run_custom
    elsif last == max
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
    @last += interval
    @last = max if last > max
  end

  def decrement
    @last -= interval
    @last = min if last < min
  end

  def interval
    rand(0..range_by)
  end

  def random_start_point
    rand(min..max)
  end

  def run_custom
    @last = progress.call(@last)
  end
end
