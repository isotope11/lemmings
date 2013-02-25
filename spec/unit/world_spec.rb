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
    x = 10
    y = 12
    subject.add_object(mock_object, x, y)
    subject.objects_at(x, y).must_equal [mock_object]
  end

  describe "object positions" do
    let(:mock_object){ mock }
    let(:x){ 10 }
    let(:y){ 20 }

    before do
      subject.add_object(mock_object, x, y)
    end

    it "knows where an object is" do
      subject.position_for(mock_object).must_equal([x, y])
    end

    it "knows how to move an object to the right" do
      subject.move_right(mock_object)
      subject.objects_at(x, y).must_equal([])
      subject.objects_at(x+1, y).must_equal([mock_object])
    end
  end
end
