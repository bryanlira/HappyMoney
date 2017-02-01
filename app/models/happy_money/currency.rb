module HappyMoney
  class Currency < ActiveRecord::Base

    # Loads and returns the currencies stored in JSON files in the config directory.
    def self.load_currencies
      parse_currency_file('currencies.json')
    end

    private

    # Parse the JSON contained on the file.
    def self.parse_currency_file(filename)
      file_path = File.expand_path('../../../../config', __FILE__)
      json = File.read("#{file_path}/#{filename}")
      json.force_encoding(::Encoding::UTF_8) if defined?(::Encoding)
      JSON.parse(json, symbolize_names: true)
    end
  end
end
