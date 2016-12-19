require 'ffaker'

FactoryGirl.define do
  factory :currency do
    country
    name                  { FFaker::Address.country }
    code                  { FFaker::Address.country_code(name) }
    regular_shipping_rate { (rand(100) + 10).to_s }
    express_shipping_rate { (rand(100) + 10).to_s }
  end
end
