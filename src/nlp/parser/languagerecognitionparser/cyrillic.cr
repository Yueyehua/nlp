module NLP
  module Parser
    module LanguageRecognitionParser
      module Cyrillic
        extend self

        def compare(str : String)
          h = Hash(NLP::Language, Float64).new
          CYRL_LANG.each do |k, v|
            h[k] = NLP::StringMetric::Similarity.weighted_jaccard(
              NLP::Text.new(str).word_frequency,
              NLP::Text.new(v, k).word_frequency
            )
          end
          exclude_from_charset(str, h).to_a.sort_by { |_, v| v }.last.first
        end

        def exclude_from_charset(str : String, h : Hash(NLP::Language, Float64))
          h.delete(NLP::Language::Belarusian) if str.match /[јљњџѓќѕђћищ]/i
          h.delete(NLP::Language::Bulgarian) if str.match /[јљњџѓќѕђћ]/i
          h.delete(NLP::Language::Macedonian) if str.match /[ъщяюй]/i
          h.delete(NLP::Language::Russian) if str.match /[јљњџѓќѕђћ]/i
          h.delete(NLP::Language::Serbian) if str.match /[ъщяюй]/i
          h.delete(NLP::Language::Ukrainian) if str.match /[ъёыэ]/i
          h
        end
      end
    end
  end
end
