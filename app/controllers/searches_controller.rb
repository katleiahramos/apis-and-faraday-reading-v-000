class SearchesController < ApplicationController
  def search
  end

  def foursquare
    @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
      req.params['client_id'] = 'AFRH04F1A4DQGCSZWWN0IZYLSFZ4T2CGMRUQ3G0BYYANPY4P'
      req.params['client_secret'] = 'ISYTRRKTQ1AQVJYFMPPKAG0UMD1CFKBTSE0J2V5AYJCY5Z35'
      req.params['v'] = '20160201'
      req.params['near'] = params[:zipcode]
      req.params['query'] = 'coffee shop'
    end
    body_hash = JSON.parse(@resp.body)
    render 'search'
  end
end
