module NLP
  module Parser
    module LanguageRecognitionParser
      module Arabic
        extend self

        def compare(str : String)
          h = Hash(NLP::Language, Float64).new
          ARAB_LANG.each do |k, v|
            h[k] = NLP::StringMetric::Similarity.jaccard(
              NLP::Text.new(str).word_frequency,
              NLP::Text.new(v, k).word_frequency
            )
          end
          h.to_a.sort_by { |_, v| v }.last.first
        end
      end
    end
  end
end
