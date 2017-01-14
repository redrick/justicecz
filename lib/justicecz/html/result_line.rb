module Justicecz
  module Html
    class ResultLine
      def initialize(result_line)
        @result_line = result_line
      end

      def self.line(result_line)
        new(result_line).line
      end

      def line
        return nil if headers.empty?
        parse_line
      end

      private

      def parse_line
        {}.tap do |parsed_result|
          headers.each_with_index do |header, index|
            parsed_result[header] = data[index]
          end
        end
      end

      def headers
        @result_line.search('th').children.map(&:text)
      end

      def data
        @result_line.search('td').children.map(&:text).map do |a|
          a.gsub(/\t|\n/, '').strip
        end.reject(&:empty?)
      end
    end
  end
end
