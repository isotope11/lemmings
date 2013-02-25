require_relative '../spec_helper'

describe "A basic world simulation" do
  it "supports lemmings moving forward" do
    world = World.new(100, 100)
    lemming = Lemming.new(world)
    position = World::Position.new(x: 0, y: 0)
    world.add_object(lemming, position)
    world.objects_at(position).must_equal([lemming])
    lemming.walk_forward
    lemming.walk_forward
    lemming.x.must_equal 2
    lemming.turn_around
    lemming.walk_forward
    lemming.x.must_equal 1
  end
end
