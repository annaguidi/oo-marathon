class Cage
  attr_accessor :animal

  def initialize
    @animal = ""
  end

  def empty?
    if @animal == ""
      true
    else
      false
    end
  end

end
