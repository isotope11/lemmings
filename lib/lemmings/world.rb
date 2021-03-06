module Lemmings
  class World
    class OutOfBoundsError < StandardError; end
    attr_accessor :winning_lemmings

    def initialize(width, height)
      @rows = []
      height.times do
        row = []
        width.times do
          row << []
        end
        @rows << row
      end
      @object_positions = {}
      @winning_lemmings = 1000
      @exited_lemmings = 0
      @exit = nil
    end

    def height
      @rows.count
    end

    def width
      @rows.first.count
    end

    def add_object(object, position)
      cell_at_position(position) << object
      @object_positions[object] = position
    end

    def objects_at(position)
      cell_at_position(position)
    end

    def position_for(object)
      @object_positions[object]
    end

    def move_right(object)
      move_to_the(:east, object)
    end

    def move_left(object)
      move_to_the(:west, object)
    end

    def lemming_exited!
      @exited_lemmings += 1
    end

    def win?
      @exited_lemmings >= winning_lemmings
    end

    def exit_at(position)
      @exit = position
    end

    private
    def move_to_the(position_term, object)
      current_position = position_for(object)
      new_position = current_position.public_send(position_term)
      check_for_exit(new_position) if object.is_a?(Lemming)
      add_object(object, new_position)
      objects_at(current_position).delete(object)
      @object_positions[object] = new_position
    end

    def check_for_exit(new_position)
      if new_position == @exit
        lemming_exited!
        true
      else
        false
      end
    end

    def cell_at_position(position)
      raise OutOfBoundsError if position.y < 0 || position.x < 0
      cell = @rows[position.y][position.x]
      raise OutOfBoundsError unless cell
      cell
    end

    def positions
      return @positions if @positions
      pos = []
      (0..height-1).each do |y|
        (0..width-1).each do |x|
          pos << Position.new(x: x, y: y)
        end
      end
      @positions = pos
    end

    class Position
      attr_reader :x, :y
      def initialize(x: x, y: y)
        @x = x
        @y = y
      end

      def north
        Position.new(x:self.x, y:self.y-1)
      end

      def south
        Position.new(x:self.x, y:self.y+1)
      end

      def east
        Position.new(x:self.x+1, y:self.y)
      end

      def west
        Position.new(x:self.x-1, y:self.y)
      end

      def ==(other)
        return false if other.nil?
        self.x == other.x && self.y == other.y
      end
    end
  end
end
