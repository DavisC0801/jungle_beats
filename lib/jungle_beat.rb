require "./lib/list"

class JungleBeat

  attr_reader :list
  attr_accessor :rate, :voice

  def initialize(data = nil)
    @list = List.new
    @rate = 500
    @voice = "Alex"
    if !data.nil?
      input = data.split
      input.each do |data|
        @list.append(data)
      end
    end
  end

  def append(data)
    input = data.split
    input.each do |data|
      @list.append(data)
    end
  end

  def count
    @list.count
  end

  def play
    beats = @list.to_string
    `say -v #{@voice} -r #{@rate} #{beats}`
  end

  def reset_rate
    @rate = 500
  end

  def reset_voice
    @voice = "Alex"
  end
end
