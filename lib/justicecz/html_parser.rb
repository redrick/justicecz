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

    def response_table_headers
      @body.search('table.result-details th').children.map(&:text)
    end

    def response_table_data
      @body.search('table.result-details td').children.map(&:text).map do |a|
        a.gsub(/\t|\n/, '').strip
      end.reject(&:empty?)
    end
  end
end
