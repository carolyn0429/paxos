require 'rubygems'
  require 'selenium-webdriver'
  require 'cucumber'
  require 'rest-client'

  class ApiClient
    @@URL = "https://api.itbit.com/v1/markets/XBTUSD/ticker"

    def get_ticker()
      response = RestClient.get(@@URL)
      return response
    end

  end