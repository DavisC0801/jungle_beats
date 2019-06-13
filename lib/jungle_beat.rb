require "./lib/list"

class JungleBeat

  attr_reader :list

  def initialize
    @list = List.new
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
end
