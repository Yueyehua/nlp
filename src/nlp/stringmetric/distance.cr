module NLP
  module StringMetric
    module Distance
      extend self

      def jaccard(a : Hash(K, V), b : Hash(K, V)) forall K, V
        1 - NLP::StringMetric::Similarity.jaccard(a, b)
      end

      def weighed_jaccard(a : Hash(K, V), b : Hash(K, V)) forall K, V
        1 - NLP::StringMetric::Similarity.weighed_jaccard(a, b)
      end
    end
  end
end
