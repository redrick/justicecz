module Justicecz
  module Entities
    class List
      attr_accessor :items

      def initialize(items = nil)
        @items = items || []
      end

      def <<(company)
        items << company
      end
    end
  end
end
