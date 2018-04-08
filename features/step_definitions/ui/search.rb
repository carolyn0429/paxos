# Paxos test
# Author: Carolyn Hung
# created at : April 01, 2018
require 'rubygems'
require 'selenium-webdriver'
require 'rspec'

When (/^I open the webpage from browser$/) do
  @driver = SearchPage.new("http://www.google.com/", "chrome")
end

When (/^I open the webpage from (.*) browser$/) do |browser_name|
  @driver = SearchPage.new("http://www.google.com/", browser_name)
end

Then (/^I should see (.*) displayed$/) do |attribute|
  case (attribute)
    when 'search box'
      @driver.find_searchbox.displayed?
    when 'search button'
      @driver.find_search_button.displayed?
  end
end

Then (/^I type (.*) in search box$/) do |keyword|
  @q = @driver.find_searchbox
  @element = @q.send_keys(keyword)
end

Then (/^I click on the search button$/) do
  @driver.find_search_button.submit
end

And (/^I should see displayed results contain (.*)$/) do |keyword|
  @driver.display_result.text.include? keyword
  @driver.close_browser
end
