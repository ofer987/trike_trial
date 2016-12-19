class ShippingRates
  def initialize(currency)
    @currency = currency
  end

  def regular
    @currency.regular_shipping_rate
  end

  def express
    @currency.express_shipping_rate
  end

  def as_json(options = nil)
    {
      regular: regular,
      express: express,
    }
  end
end
