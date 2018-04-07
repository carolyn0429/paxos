# Dataiku test
# Author: Carolyn Hung
# created at : Mar 27, 2018
require 'rspec'
require 'cucumber'
require 'rest-client'

# https://api.itbit.com/v1/markets/XBTUSD/ticker

When (/^I am a non-authenticated user$/) do
  @client = ApiClient.new
  puts "[INFO]: Initialize an api client..."
end

Then (/^I send GET request to endpoint$/) do
  @response = @client.get_ticker()
end

And (/^I should see (.*) in the result$/) do |keyword|
  @response = JSON.parse(@response.body)
  @response["pair"].to_s.should include(keyword)
end