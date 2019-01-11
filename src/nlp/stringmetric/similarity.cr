module NLP
  module StringMetric
    module Similarity
      extend self

      def jaccard(a : Hash(K, V), b : Hash(K, V)) forall K, V
        i = NLP::StringMetric.intersection_of(a, b).size
        u = NLP::StringMetric.union_of(a, b).size
        i.to_f / u
      end

      def weighted_jaccard(a : Hash(K, V), b : Hash(K, V)) forall K, V
        i = NLP::StringMetric.intersection_of(a, b).values.sum
        u = NLP::StringMetric.union_of(a, b).values.sum
        i.to_f / u
      end
    end
  end
end
