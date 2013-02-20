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

      @topleft = [ 320 + 100 * Math.sin(@angle),
                   240 - 100 * Math.cos(@angle)]
    end
  end
end
