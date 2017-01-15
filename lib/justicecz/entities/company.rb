module Justicecz
  module Entities
    class Company
      ATTRIBUTES = %i(title misc ico file_number registered_at residence)

      attr_accessor(*ATTRIBUTES)

      def initialize(params = {})
        return if params.empty?
        params.each do |k, v|
          self.public_send("#{k}=", v)
        end
      end

      ATTRIBUTES.each do |attr|
        define_method "#{attr}_full" do
          key = ::Justicecz::Misc::ParamsLookup.by_key(attr)
          "#{key}: #{self.public_send(attr)}"
        end
      end

      ATTRIBUTES.each do |attr|
        define_method "#{attr}_header" do
          ::Justicecz::Misc::ParamsLookup.by_key(attr)
        end
      end
    end
  end
end
