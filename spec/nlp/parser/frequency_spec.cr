require "../../spec_helper"

describe NLP::Parser::Frequency do
  it "generates a frequency map." do
    arr = ["a", "b", "a", "c", "d", "a", "b"]
    m = NLP::Parser::Frequency.count(arr)
    m.should be_a Hash(String, Int32)
    h = { "a" => 3, "b" => 2, "c" => 1, "d" => 1 }
    m.should eq h
  end
end
