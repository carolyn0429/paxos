# Paxos test
# Author: Carolyn Hung
# created at : April 01, 2018
#
#    Write a gherkin scenario
#    Write step defs and any needed code to run the feature file in cucumber
#    Verify the browser url includes the searched term (paxos)
#    Verify Paxos Bankchain appears on the search results page
#    Facilitate the test to run the test for different browsers
#    Report the status of test cases
#  Bonus:
#      Use a POM (Page Object Model)
#      Use a data file so the user can search for multiple terms listed in the file
#      Error handling and negative test scenarios
#      Using an api call to https://api.itbit.com/v1/markets/XBTUSD/ticker verify the currency pair 'XBTUSD' is in the results returned
#

Feature: searching for Paxos via google search

  Scenario Outline: verify <attribute> displayed on the page
    When I open the webpage from browser
    Then I should see <attribute> displayed
    Examples:
      | attribute |
      | search box |
      | search button |

  Scenario Outline: verify search term displayed on different browsers
    When I open the webpage from <browser> browser
    Then I should see <attribute> displayed
    Examples:
      | attribute | browser |
      | search box | chrome |
      | search button | chrome |
      | search box| firefox  |
      | search button | firefox |


  Scenario Outline: verify search results should display on the page
    When I open the webpage from browser
    And I should see search box displayed
    Then I type <keyword> in search box
    Then I click on the search button
    And I should see displayed results contain <keyword> of search
    Examples:
      | keyword |
      | Paxos Bankchain|
      | blockchain |
