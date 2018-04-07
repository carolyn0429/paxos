# Paxos test
# Author: Carolyn Hung
# created at : April 01, 2018


Feature: verify api call result

  Scenario: verify api call
    When I am a non-authenticated user
    Then I send GET request to endpoint
    And I should see XBTUSD in the result
