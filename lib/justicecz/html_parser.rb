module Justicecz
  class HtmlParser
    def initialize(body)
      @body = ::Nokogiri::HTML(body)
      @collection = ::Justicecz::Entities::List.new
    end

    def self.parse(body)
      new(body).parse
    end

    def parse
      parse_response
      @collection
    end

    private

    def result_collection
      Justicecz::Html::ResultList.collection(@body)
    end

    def parse_response
      result_collection.each do |result|
        next unless Justicecz::Html::ResultLine.line(result)
        @collection << Justicecz::Html::ResultLine.line(result)
      end
    end
  end
end
