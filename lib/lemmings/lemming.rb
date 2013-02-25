module Lemmings
  class Lemming
    include Celluloid

    attr_reader :direction

    def initialize(world)
      @world = world
      @direction = :right
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

    def x
      position.x
    end

    def y
      position.y
    end

    def tick
      walk_forward
    end

    def start_timer
      every(0.02){ tick }
    end

    def walk_forward
      @world.public_send("move_#{direction}", Actor.current)
    rescue World::OutOfBoundsError
      turn_around
    end

    def turn_around
      @direction = (@direction == :right) ? :left : :right
    end

    private
    def position
      @world.position_for(Actor.current)
    end
  end
end
