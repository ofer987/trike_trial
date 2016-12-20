require 'rails_helper'

RSpec.describe ShippingRatesController do
  describe 'shipping_rates' do
    subject(:shipping_rates) do
      get :index, {
        country_code: code,
        currency_code: currency.code,
        format: :json
      }
    end

    let(:code)     { 'AU' }
    let!(:country) { FactoryGirl.create :country, code: code }
    let!(:currency) { FactoryGirl.create :currency, country: country }

    before { FactoryGirl.create :country, code: 'US' }

    it { is_expected.to be_successful }

    describe 'response body' do
      subject(:response_body) do
        shipping_rates
        JSON.parse(response.body)
      end

      specify { expect(response_body['regular']).to eq currency.regular_shipping_rate }
      specify { expect(response_body['express']).to eq currency.express_shipping_rate }
    end
  end
end
