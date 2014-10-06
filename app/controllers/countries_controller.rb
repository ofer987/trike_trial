class CountriesController < ApplicationController

  def shipping_rates
    @country = Country.find_by_code(shipping_rates_params[:country_code])
    respond_to do |format|
      format.json do
        render :json => {
          :regular => @country.regular_shipping_rate,
          :express => @country.express_shipping_rate
        }
      end
    end
  end

private

  def shipping_rates_params
    params.permit(:country_code)
  end

end
