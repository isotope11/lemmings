require_relative '../spec_helper'

describe Lemming do
  it "can be initialized" do
    Lemming.new.must_be_kind_of Lemming
  end
end
