module NLP
  module Parser
    module Frequency
      extend self

      def count(arr : Array(T)) forall T
        h = Hash(T, Int32).new
        arr.each do |e|
          h[e] = 1 unless h.has_key?(e)
          h[e] += 1
        end
        h
      end
    end
  end
end
