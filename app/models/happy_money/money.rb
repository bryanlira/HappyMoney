module HappyMoney
  class Money < ActiveRecord::Base
    require 'httparty'
    include Arithmetic

    attr_accessor :amount, :currency

    # Override of the initialize method to simplify the assign of the parameters
    def initialize(amount, currency)
      @amount = amount.to_f.round(2)
      @currency = is_valid_currency?(format_currency(currency))
    end

    # Getter that return the amount and the currency of the Money
    def inspect
      @amount.to_s + ' ' + @currency
    end

    # Verify that the currency is correct, in case of being wrong or the currency written
    # isn't find on the currency list, EUR is set as default.
    def is_valid_currency?(currency)
      Currency.load_currencies[currency.to_sym].nil? ? 'EUR' : currency
    end

    # Remove all non alphabetic characters and upcase the currency.
    def format_currency(currency)
      currency.gsub(/[^a-zA-Z]/, '').upcase
    end

    # Returns a new Money object containing the new amount and the new currency
    def convert_to(new_currency)
      currency_rate = get_currency_rate(new_currency)
      unless currency_rate == 'no_value'
        self.class.new(self.amount * currency_rate, new_currency)
      end
    end

    # To convert a currency it consume a service from the web page http://free.currencyconverterapi.com/ to get the
    # rate between both currencies.
    def get_currency_rate(new_currency)
      url = 'http://free.currencyconverterapi.com/api/v3/convert?q='+ self.currency + '_' +
          format_currency(new_currency) + '&compact=ultra'
      currency_value = HTTParty.get(url).try(:first).try(:[], 1)
      currency_value.nil? ? 'no_value' : currency_value.to_f.round(2)
    end
  end
end
