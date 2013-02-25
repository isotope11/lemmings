require_relative '../spec_helper'

describe "A basic world simulation" do
  it "supports lemmings moving forward" do
    world = World.new(100, 100)
    lemming = Lemming.new(world)
    world.add_object(lemming, 0, 0)
    world.objects_at(0, 0).must_equal([lemming])
    lemming.walk_forward
    lemming.walk_forward
    lemming.x.must_equal 2
  end
end
