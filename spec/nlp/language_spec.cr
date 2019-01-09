require "../spec_helper"

describe NLP::Language do
  it "should search for a valid language." do
    l = NLP::Language.search :English
    l.should be_a NLP::Language
  end
  expect_raises(NLP::LanguageException) do
    l = NLP::Language.search :Klingon
  end
end
