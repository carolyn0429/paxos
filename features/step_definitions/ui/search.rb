# Paxos test
# Author: Carolyn Hung
# created at : April 01, 2018
require 'rubygems'
require 'selenium-webdriver'
require 'rspec'

When (/^I open the webpage from browser$/) do

  @driver = Selenium::WebDriver.for :chrome
  @driver.navigate.to "http://www.google.com/"
end

When (/^I open the webpage from (.*) browser$/) do |browser_name|
  @driver = Selenium::WebDriver.for :"#{browser_name}"
  @driver.navigate.to "http://www.google.com/"
end

Then (/^I should see (.*) displayed$/) do |attribute|
  case (attribute)
    when 'search box'
      @driver.find_element(:name, 'q').displayed?
    when 'search button'
      @driver.find_element(:name,'btnK').displayed?
  end
end

Then (/^I type (.*) in search box$/) do |keyword|
  @q = @driver.find_element(:name, 'q')
  @element = @q.send_keys(keyword)
end

Then (/^I click on the search button$/) do
  @driver.find_element(:name, 'btnG').submit
end

And (/^I should see displayed results contain (.*)$/) do |keyword|
  @driver.find_element(:id, 'rhs').text.include? keyword
  @driver.quit
end

And (/^I should see browser url includes (.*)/) do |keyword|
  @element.submit
end