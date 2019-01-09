require "./spec_helper"
require "./nlp/**"

describe NLP do
  it "has a version number" do
    NLP::VERSION.should_not be_nil
  end
end
