module NLP
  module Parser
    module LanguageRecognitionParser
      extend self

      def calculate_similarity(str : String, reference : String)
        NLP::StringMetric::Similarity.jaccard(str, reference)
      end

      def find_regex(str : String, regexp : Regex) : Bool
        str.match(regexp) ? true : false
      end

      def is_arabic?(str : String) : Bool
        find_regex(str, /\p{Arabic}/)
      end

      def is_armenian?(str : String) : Bool
        find_regex(str, /\p{Armenian}/)
      end

      def is_bengali?(str : String) : Bool
        find_regex(str, /\p{Bengali}/)
      end

      def is_chinese?(str : String) : Bool
        find_regex(str, /\p{Han}/) && !is_japanese?(str) && !is_korean?(str)
      end

      def is_cyrillic?(str : String) : Bool
        find_regex(str, /\p{Cyrillic}/)
      end

      def is_devanagari?(str : String) : Bool
        find_regex(str, /\p{Devanagari}/)
      end

      def is_georgian?(str : String) : Bool
        find_regex(str, /\p{Georgian}/)
      end

      def is_greek?(str : String) : Bool
        find_regex(str, /\p{Greek}/)
      end

      def is_guarani?(str : String) : Bool
        is_latin?(str) && find_regex(str, /g̃/i)
      end

      def is_gujarati?(str : String) : Bool
        find_regex(str, /\p{Gujarati}/)
      end

      def is_gurmukhi?(str : String) : Bool
        find_regex(str, /\p{Gurmukhi}/)
      end

      def is_hebrew?(str : String) : Bool
        find_regex(str, /\p{Hebrew}/)
      end

      def is_japanese?(str : String) : Bool
        find_regex(str, /\p{Hiragana}|\p{Katakana}/)
      end

      def is_latin?(str : String) : Bool
        find_regex(str, /\p{Latin}/)
      end

      def is_khmer?(str : String) : Bool
        find_regex(str, /\p{Khmer}/)
      end

      def is_korean?(str : String) : Bool
        find_regex(str, /\p{Hangul}/)
      end

      def is_tamil?(str : String) : Bool
        find_regex(str, /\p{Tamil}/)
      end

      def is_tibetan?(str : String) : Bool
        find_regex(str, /\p{Tibetan}/)
      end

      def parse(str : String) : NLP::Language | Nil
        case
        when is_japanese?(str)   then NLP::Language::Japanese
        when is_korean?(str)     then NLP::Language::Korean
        when is_chinese?(str)    then NLP::Language::Chinese
        when is_khmer?(str)      then NLP::Language::Khmer
        when is_bengali?(str)    then NLP::Language::Bengali
        when is_devanagari?(str) then NLP::Language::Devanagari
        when is_gujarati?(str)   then NLP::Language::Gujarati
        when is_gurmukhi?(str)   then NLP::Language::Gurmukhi
        when is_tibetan?(str)    then NLP::Language::Tibetan
        when is_hebrew?(str)     then NLP::Language::Hebrew
        when is_greek?(str)      then NLP::Language::Greek
        when is_armenian?(str)   then NLP::Language::Armenian
        when is_georgian?(str)   then NLP::Language::Georgian
        when is_tamil?(str)      then NLP::Language::Tamil
        when is_guarani?(str)    then NLP::Language::Guarani
        when is_cyrillic?(str)   then which_cyrillic?(str)
        when is_arabic?(str)     then which_arabic?(str)
        when is_latin?(str)      then which_latin?(str)
        end
      end

      def which_cyrillic?(str : String) : NLP::Language
        NLP::Parser::LanguageRecognitionParser::Cyrillic.compare(str)
      end

      def which_arabic?(str : String) : NLP::Language
        NLP::Parser::LanguageRecognitionParser::Arabic.compare(str)
      end

      def which_latin?(str : String) : NLP::Language
        NLP::Parser::LanguageRecognitionParser::Latin.compare(str)
      end
    end
  end
end
