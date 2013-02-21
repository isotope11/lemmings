module Lemmings
  class Lemming
    include Celluloid

    attr_accessor :topleft # Lol this needs to not be leaking here or something

    def initialize
      @angle = 2*Math::PI * rand
      @topleft = [0, 0]
    end

    def update(seconds_passed)
      # This example makes the objects orbit around the center of the screen.
      # The objects make one orbit every 4 seconds
      @angle = ( @angle + 2*Math::PI / 4 * seconds_passed) % ( 2*Math::PI)

      # Odd this happens to be half the width and height of the screen.
      # How does the lemming know about this? Oh thats right it doesn't.
      # Iterate :)
      self.x = 320 + 100 * Math.sin(@angle)
      self.y = 240 - 100 * Math.cos(@angle)
    end

    def move_right
      self.x = x + 1
    end

    def move_left
      self.x = x - 1
    end

    def x
      @topleft[0]
    end

    def y
      @topleft[1]
    end

    def x=(val)
      @topleft[0] = val
    end

    def y=(val)
      @topleft[1] = val
    end
  end
end
