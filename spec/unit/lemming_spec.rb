require_relative '../spec_helper'

describe Lemming do
  let(:world){ mock "World" }
  let(:subject){ Lemming.new(world) }

  it "can be initialized" do
    subject.must_be_kind_of Lemming
  end

  it "can move right" do
    world.expects(:move_right).with(subject)
    subject.move_right
  end

  it "can move left" do
    world.expects(:move_left).with(subject)
    subject.move_left
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
