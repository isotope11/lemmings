module Lemmings
  class World
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
      objects_at(current_position).delete(object)
      add_object(object, current_position.public_send(position_term))
    end

    def cell_at_position(position)
      @rows[position.y][position.x]
    end

    def positions
      pos = []
      (0..height-1).each do |y|
        (0..width-1).each do |x|
          pos << Position.new(x, y)
        end
      end
      pos
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
