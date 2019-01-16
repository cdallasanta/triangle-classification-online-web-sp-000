class Triangle
  attr_accessor :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    sides = [side1,side2,side3]
    if sides.any?{|side| side <= 0}
      begin
        raise_error
      rescue TriangleError => error
        puts error.message
      end
    elsif side1 == side2 && side2 == side3
      :equilateral
    elsif side1 == side2 || side1 == side3 || side2 == side3
      :isosceles
    elsif sides.max < (side1+side2+side3) - sides.max
      :scalene
    else
      #begin
        raise TriangleError
      #rescue TriangleError => error
      #  puts error.message
      #end
    end
  end

  class TriangleError < StandardError
    #def message
    #  "This is not a valid triangle"
    #end
  end
end
