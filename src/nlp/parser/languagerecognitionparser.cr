module NLP
  module Parser
    module LanguageRecognitionParser
      extend self

      def check_charsets(str : String, charsets : String)
        str.match(%r((#{charsets}))).nil? ? false : true
      end

      def is_armenian?(str : String)
        check_charsets(str, "\\p{Armenian}")
      end

      def is_cyrillic?(str : String)
        check_charsets(str, "\\p{Cyrillic}")
      end

      def is_georgian?(str : String)
        check_charsets(str, "\\p{Georgian}")
      end

      def is_greek?(str : String)
        check_charsets(str, "\\p{Greek}")
      end

      def is_japanese?(str : String)
        check_charsets(
          str,
          "\\p{Hiragana}|\\p{Katakana}|[\\x{3000}-\\x{303F}]"
        )
      end

      def is_khmer?(str : String)
        check_charsets(str, "\\p{Khmer}")
      end

      def is_korean?(str : String)
        check_charsets(str, "\\p{Hangul}")
      end

      def is_serbian?(str : String)
        is_cyrillic?(str) && ! check_charsets(str, "ъщяюй")
      end
    end
  end
end
