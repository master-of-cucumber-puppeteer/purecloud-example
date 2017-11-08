#Reconciled with TCDB on GIMPY at 8/15/2017 10:09:11 AM
@Tcdb.TestSuiteId=3617 @screen_share_call @PURE-1166
Feature: ACD Screen Sharing from a voice interaction
  As an agent, in order to provide improved customer service, I want my customer to share their screen with me.

  https://inindca.atlassian.net/browse/PURE-1166

  Background:
    Given I am a call to screen share agent logged into collaborate
    And a queue admin has added me to my new queue
    And I am set to on queue and can receive a simulated call
    When I receive a call through the queue from a simulated customer
    And my call is connected with the simulated customer

  #------------CRITICAL ACD SCREEN-SHARE FROM CALL----------#
  @p1 @automated @Tcdb.TestCaseId=49774 @critical
  Scenario: Agent and customer are able to use screen-share over a call
    Given I start a sharing session with the customer
    When the simulated customer enters the correct activation code
    Then the customer sees they are screen sharing
    And I am able to see the customer's browser
    When the customer disconnects the screen sharing session
    Then the screen sharing session is displayed as disconnected within 60 seconds
    And the customer sees they are not screen sharing
    And our call is still active
