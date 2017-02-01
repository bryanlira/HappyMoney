module HappyMoney
  class Money < ActiveRecord::Base
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
  end
end
