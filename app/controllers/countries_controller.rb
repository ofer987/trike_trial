class CountriesController < ApplicationController
  def shipping_rates
    @country = Country.find_by(code: shipping_rates_params[:country_code])
    currency = @country
      .currencies
      .where(code: shipping_rates_params[:currency_code])
      .first
    shipping_rates = ShippingRates.new(currency)

    respond_to do |format|
      format.json do
        render json: shipping_rates
      end
    end
  end

  private

  def shipping_rates_params
    params.permit(:country_code, :currency_code)
  end
end
