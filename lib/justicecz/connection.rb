module Justicecz
  class Connection
    URL = 'https://or.justice.cz'.freeze

    def initialize
      @connection = ::Faraday.new(url: URL) do |faraday|
        faraday.adapter Faraday.default_adapter
      end
    end

    def get(uri)
      @connection.get(uri)
    end
  end
end
