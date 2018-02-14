class Fraccion
   attr_reader :x, :y
   def initialize(x, y)
      @x, @y = x, y
   end

   def to_s
      "#{@x}/#{@y}"
   end
   
   def * (other)
      Fraccion.new(@x * other.x, @y * other.y)
   end 
   
   def + (other)
      Fraccion.new((@x * other.y) + (other.x * @y), @y * other.y)
   end
   
   def - (other)
      Fraccion.new((@x * other.y) - (other.x * @y), @y * other.y)
   end
   
   def / (other)
      Fraccion.new(@x * other.y, @y * other.x)
   end
end	
