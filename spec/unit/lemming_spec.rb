require_relative '../spec_helper'

describe Lemming do
  let(:world){ mock "World" }
  let(:subject){ Lemming.new(world) }

  it "can be initialized" do
    subject.must_be_kind_of Lemming
  end

  it "knows its direction" do
    subject.direction.must_equal :right
  end

  it "can turn around" do
    subject.turn_around
    subject.direction.must_equal :left
    subject.turn_around
    subject.direction.must_equal :right
  end

  it "requests to be moved by the world when walking forward" do
    world.expects(:move_right).with(subject)
    subject.walk_forward
    subject.turn_around
    world.expects(:move_left).with(subject)
    subject.walk_forward
  end

  it "knows its x coordinate" do
    world.expects(:position_for).with(subject).returns([1, 2])
    subject.x.must_equal 1
  end

  it "knows its y coordinate" do
    world.expects(:position_for).with(subject).returns([1, 2])
    subject.y.must_equal 2
  end
end
