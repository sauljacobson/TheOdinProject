require './lib/calculator' 

describe Calculator do
  describe "#add" do 
    it "returns the sum of two numbers" do
      calculator = Calculator.new
      expect(calculator.add(5, 2)).to eql(7)
    end

    it "returns the sum of more than two numbers" do 
      calculator = Calculator.new
      expect(calculator.add(2, 5, 7)).to eql(14) 
    end 
  end

  describe "#subtract" do 
    it "returns the difference of two numbers" do 
      calculator = Calculator.new 
      expect(calculator.subtract(1000, 7)).to eql(993)
    end 

    it "returns the difference of more than two numbers" do 
      calculator = Calculator.new
      expect(calculator.subtract(45, 15, 30)).to eql(0)
    end 
  end

  describe "#multiply" do 
    it "returns the product of two numbers" do
      calculator = Calculator.new 
      expect(calculator.multiply(4, 3)).to eql(12)
    end

    it "returns the product of more than two numbers" do 
      calculator = Calculator.new 
      expect(calculator.multiply(-1, 5, -3)).to eql(15)
    end
  end 

  describe "#divide" do
    it "returns the quotient of two numbers" do 
      calculator = Calculator.new 
      expect(calculator.divide(12, 3)).to eql(4)
    end 

    it "returns the quotient of more than two numbers" do
      calculator = Calculator.new
      expect(calculator.divide(50, 25, 2)).to eql(1) 
    end 

    it "returns nil if divided by 0" do 
      calculator = Calculator.new 
      expect(calculator.divide(50, 0)).to eql(nil)
    end 

    it "returns nil if divided by 0" do 
      calculator = Calculator.new 
      expect(calculator.divide(12, 4, 0, 5)).to eql(nil)
    end 
  end
end 

