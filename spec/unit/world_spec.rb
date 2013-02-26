require_relative '../spec_helper'

describe World do
  subject { World.new(100, 100) }

  it "can be initialized" do
    subject.must_be_kind_of World
  end

  it "has boundaries" do
    subject.width.must_equal 100
    subject.height.must_equal 100
  end

  it "can have an object added at specified coordinates" do
    mock_object = mock
    position = World::Position.new(x:10, y:12)
    subject.add_object(mock_object, position)
    subject.objects_at(position).must_equal [mock_object]
  end

  describe "object positions" do
    let(:mock_object){ mock }
    let(:position){ World::Position.new(x:10, y:20) }

    before do
      subject.add_object(mock_object, position)
    end

    it "knows where an object is" do
      subject.position_for(mock_object).must_equal(position)
    end

    it "knows how to move an object to the right" do
      subject.move_right(mock_object)
      subject.objects_at(position).must_equal([])
      subject.objects_at(position.east).must_equal([mock_object])
    end
  end

  describe "winning" do
    it "can have winning_lemmings set" do
      subject.winning_lemmings = 2
      subject.winning_lemmings.must_equal 2
    end

    it "wins if exited_lemmings >= winning_lemmings" do
      subject.winning_lemmings = 3
      subject.lemming_exited!
      subject.lemming_exited!
      subject.lemming_exited!
      subject.win?.must_equal true
    end
  end

  describe "setting an exit" do
    it "can have an exit declared with a position" do
      position = World::Position.new(x: 5, y: 7)
      subject.exit_at(position)
    end
  end
end
