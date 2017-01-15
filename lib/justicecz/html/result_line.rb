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
        headers.each_with_index do |element, index|
          header = to_header(element)
          key = ::Justicecz::Misc::ParamsLookup.by_value(header)
          data = element.next_element
          @company.public_send("#{key}=", to_data(data))
        end
      end

      def to_header(element)
        element.children.text.gsub(/:$/, '')
      end

      def to_data(element)
        data = element.children.map(&:text).map do |text|
          text.gsub(/\t|\n/, '').strip
        end.reject(&:empty?)
        @company.misc = data.slice(1..-1).join(', ') if data.slice(1..-1).count.positive?
        data.first
      end

      def headers
        @result_line.search('th')
      end
    end
  end
end
