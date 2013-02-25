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

    def add_object(object, x, y)
      @rows[y][x] << object
    end

    def objects_at(x, y)
      @rows[y][x]
    end

    def position_for(object)
      # LOL SO INEFFICIENT
      positions.detect do |p|
        objects_at(*p).include?(object)
      end
    end

    def move_right(object)
      current_position = position_for(object)
      objects_at(*current_position).delete(object)
      add_object(object, current_position[0] + 1, current_position[1])
    end

    def move_left(object)
    end

    private
    def positions
      pos = []
      (0..height-1).each do |y|
        (0..width-1).each do |x|
          pos << [x, y]
        end
      end
      pos
    end
  end
end
