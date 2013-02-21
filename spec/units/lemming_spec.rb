require_relative '../spec_helper'

describe Lemming do
  subject { Lemming.new }

  it "can be initialized" do
    subject.must_be_kind_of Lemming
  end

  it "can move right" do
    subject.move_right
    subject.x.must_equal 1
    subject.move_right
    subject.x.must_equal 2
  end

  it "can move left" do
    subject.move_left
    subject.x.must_equal -1
    subject.move_left
    subject.x.must_equal -2
  end

  it "knows its x coordinate" do
    subject.x.must_equal 0
  end

  it "knows its y coordinate" do
    subject.y.must_equal 0
  end

  it "can set x" do
    subject.x = 4
    subject.x.must_equal 4
  end

  it "can set y" do
    subject.y = 4
    subject.y.must_equal 4
  end
end
