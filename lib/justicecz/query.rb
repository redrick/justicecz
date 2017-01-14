module Justicecz
  class Query
    def initialize(query_params)
      @query_params = query_params
    end

    def self.query(ico)
      new(ico).query
    end

    def query
      parse_response
    end

    private

    def parse_response
      HtmlParser.parse(response.body)
    end

    def connection
      Connection.new
    end

    def response
      connection.get "/ias/ui/rejstrik-$firma?#{formatted_query_params}"
    end

    def formatted_query_params
      query = [].tap do |query_array|
        @query_params.each do |key, value|
          query_array << "#{key}=#{value}"
        end
      end
      query.join('&')
    end
  end
end
