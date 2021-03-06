Spree::Money.class_eval do

  def initialize(amount, options = {})
      @money = ::Monetize.parse([amount, Spree::Currency.current.char_code].join)
      @options = {}
      @options[:with_currency] = true
      @options[:symbol_position] = :before
      @options[:no_cents] = false
      @options[:decimal_mark] = '.'
      @options[:thousands_separator] = ','
      @options.merge!(options)
      # Must be a symbol because the Money gem doesn't do the conversion
      @options[:symbol_position] = @options[:symbol_position].to_sym
  end
end
