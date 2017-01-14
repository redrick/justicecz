module Justicecz
  module Html
    class ResultList
      def initialize(body)
        @body = body
      end

      def self.collection(body)
        new(body).collection
      end

      def collection
        @body.search('li.result table.result-details')
      end
    end
  end
end
