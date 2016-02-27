class ZooAtCapacity < StandardError
end

class Zoo
  attr_reader :season_opening_date, :season_closing_date, :cages, :employees

  def initialize(name,season_opening_date,season_closing_date)
    @name = name
    @season_opening_date = season_opening_date
    @season_closing_date = season_closing_date
    @cages = []
    @employees = []
    10.times do
      @cages << Cage.new
    end
  end

  def add_employee(name)
    @employees << name
  end

  def open?(date)
    date >= @season_opening_date && date <= @season_closing_date
  end

  def add_animal(animal_object)
    @cages.each do |cage|
      if cage.empty?
        cage.animal = animal_object
        break
      elsif cage == @cages.last && !cage.empty?
        raise ZooAtCapacity
      end
    end
  end

  def visit
    greeting = ""
    @employees.each do |employee|
      greeting << "#{employee.greet}\n"
    end
    @cages.each do |cage|
      unless cage.empty?
        greeting << "#{cage.animal.speak}\n"
      end
    end
    greeting
  end

end
