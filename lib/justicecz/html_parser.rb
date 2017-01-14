module Justicecz
  class HtmlParser
    def initialize(body)
      @body = Nokogiri::HTML(body)
    end

    def self.parse(body)
      new(body).parse
    end

    def parse
      parse_response
    end

    private

    def parse_response
      data_headers = @body.search('table.result-details th').children
      return {} if data_headers.empty?
      {}.tap do |parsed_result|
        response_table_headers.each_with_index do |header, index|
          parsed_result[header] = response_table_data[index]
        end
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
