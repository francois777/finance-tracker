class Stock < ApplicationRecord

  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(
      publishable_token: 'Tpk_8e91ed071b4c419b989ed3d77430a8ec',
      endpoint: 'https://sandbox.iexapis.com/v1'
    )
    client.price(ticker_symbol)
  end
end
