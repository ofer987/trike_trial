require 'rails_helper'

RSpec.describe CountriesController do
  describe 'shipping_rates' do
    subject(:shipping_rates) { get :shipping_rates, country_code: code, format: :json }

    let(:code)     { 'AU' }
    let!(:country) { FactoryGirl.create :country, code: code }

    before { FactoryGirl.create :country, code: 'US' }

    it { is_expected.to be_successful }

    describe 'response body' do
      subject(:response_body) do
        shipping_rates
        JSON.parse(response.body)
      end

      specify { expect(response_body['regular']).to eq country.regular_shipping_rate }
      specify { expect(response_body['express']).to eq country.express_shipping_rate }
    end
  end
end
