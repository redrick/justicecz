$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'justicecz'
require 'faraday'
require 'nokogiri'
require 'vcr'

require 'simplecov'
SimpleCov.start

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :faraday
  config.default_cassette_options = { record: :once }
  config.before_record { |i| i.response.body.force_encoding 'UTF-8' }
  config.before_record do |i|
    i.request.headers.clear
    save_headers = %w(Total Per-Page Link Content-Type Content-Length)
    i.response.headers.select! { |key| save_headers.include? key }
  end
end
