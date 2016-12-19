class ShippingRates
  def initialize(country)
    @country = country
  end

  def regular
    @country.regular_shipping_rate
  end

  def express
    @country.express_shipping_rate
  end

  def as_json(options = nil)
    {
      regular: regular,
      express: express,
    }
  end
end
