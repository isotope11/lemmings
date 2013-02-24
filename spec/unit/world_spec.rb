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
end
