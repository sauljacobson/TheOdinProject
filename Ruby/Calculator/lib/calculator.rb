class Calculator
  def add(*args) 
    args.reduce(:+) 
  end

  def subtract(*args) 
    args.reduce(:-)
  end

  def multiply(*args) 
    args.reduce(:*)
  end 

  def divide(*args)
    args.reduce do |x, y|
      return nil if y == 0 
      x / y 
    end
  end
end 
