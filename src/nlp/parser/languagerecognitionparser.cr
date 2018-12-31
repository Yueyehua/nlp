module NLP
  module Parser
    module LanguageRecognitionParser
      extend self

      def is_japanese?(str : String)
        jp_charsets = "\\p{Hiragana}|\\p{Katakana}|\\p{Han}|" \
          "[\\x{3000}-\\x{303F}]|[\\x{FF5F}-\\x{FF9F}]"
        str.match(%r((#{jp_charsets}))).nil? ? false : true
      end
    end
  end
end
