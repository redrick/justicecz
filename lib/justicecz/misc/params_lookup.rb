module Justicecz
  module Misc
    class ParamsLookup
      PARAMS_MAP = {
        title: 'Název subjektu',
        ico: 'IČO',
        file_number: 'Spisová značka',
        registered_at: 'Den zápisu',
        residence: 'Sídlo'
      }

      def self.by_key(key)
        PARAMS_MAP[key]
      end

      def self.by_value(value)
        PARAMS_MAP.key(value)
      end
    end
  end
end
