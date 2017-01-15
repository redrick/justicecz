module Justicecz
  module Html
    class ResultLine
      def initialize(result_line)
        @result_line = result_line
        @company = ::Justicecz::Entities::Company.new
      end

      def self.line(result_line)
        new(result_line).line
      end

      def line
        return nil if headers.empty?
        parse_line
        @company
      end

      private

      def parse_line
        headers.each_with_index do |header, index|
          key = ::Justicecz::Misc::ParamsLookup.by_value(header)
          @company.public_send("#{key}=", data[index])
        end
      end

      def headers
        @result_line.search('th').children.map(&:text)
          .map { |h| h.gsub(/:$/, '') }
      end

      def data
        @result_line.search('td').children.map(&:text).map do |a|
          a.gsub(/\t|\n/, '').strip
        end.reject(&:empty?)
      end
    end
  end
end
