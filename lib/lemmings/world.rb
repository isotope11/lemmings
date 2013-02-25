module Lemmings
  class World
    class OutOfBoundsError < StandardError; end
    def initialize(width, height)
      @rows = []
      height.times do
        row = []
        width.times do
          row << []
        end
        @rows << row
      end
    end

    def height
      @rows.count
    end

    def width
      @rows.first.count
    end

    def add_object(object, position)
      cell_at_position(position) << object
    end

    def objects_at(position)
      cell_at_position(position)
    end

    def position_for(object)
      # LOL SO INEFFICIENT
      positions.detect do |p|
        objects_at(p).include?(object)
      end
    end

    def move_right(object)
      move_to_the(:east, object)
    end

    def move_left(object)
      move_to_the(:west, object)
    end

    private
    def move_to_the(position_term, object)
      current_position = position_for(object)
      new_position = current_position.public_send(position_term)
      add_object(object, new_position)
      objects_at(current_position).delete(object)
    end

    def cell_at_position(position)
      raise OutOfBoundsError if position.y < 0
      raise OutOfBoundsError if position.x < 0
      cell = @rows[position.y][position.x]
      raise OutOfBoundsError if !cell
      cell
    end

    def positions
      return @positions if @positions
      pos = []
      (0..height-1).each do |y|
        (0..width-1).each do |x|
          pos << Position.new(x, y)
        end
      end
      @positions = pos
    end

    class Position < Struct.new(:x, :y)
      def north
        Position.new(x=self.x, y=self.y-1)
      end

      def south
        Position.new(x=self.x, y=self.y+1)
      end

      def east
        Position.new(x=self.x+1, y=self.y)
      end

      def west
        Position.new(x=self.x-1, y=self.y)
      end
    end
  end
end
