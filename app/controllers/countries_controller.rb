class CountriesController < ApplicationController
  def shipping_rates
    @country = Country.find_by(code: shipping_rates_params[:country_code])
    shipping_rates = ShippingRates.new(@country)

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
