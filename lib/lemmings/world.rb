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
  end
end
