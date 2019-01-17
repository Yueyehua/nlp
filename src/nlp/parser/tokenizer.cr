module NLP
  module Parser
    module Tokenizer
      extend self

      def default(str : String) : Array(String)
        str.split(/\P{L}+/)
      end

      def no_space(str)
        # TODO: Put your code here
        [] of String
      end

      def tokenize(str : String, language : NLP::Language | Nil)
        case language
        when NLP::Language::Chinese,
             NLP::Language::Japanese,
             NLP::Language::Korean
          no_space(str)
        else
          default(str)
        end
      end
    end
  end
end
