#Reconciled with TCDB on GIMPY at 8/15/2017 10:09:29 AM
@Tcdb.TestSuiteId=3832 @screen_share_chat @PURE-1540
Feature: ACD screen share from Chat
As an agent, in order to provide improved customer service, I want to upgrade my standard acd chat conversation to screenshare


Background:
  Given I am a chat to screen share agent logged into collaborate
  And a queue admin has added me to my new queue
  And I am on queue without a station associated
  And I am in a screen share enabled chat conversation with a customer through my queue

  #------------CRITICAL ACD SCREEN-SHARE FROM CHAT----------#
  @p1 @Tcdb.TestCaseId=51945 @automated @critical
  Scenario: Agent and customer are able to use screen-share over a chat
    Given I am in a screen share session with the customer
    When the customer ends the screen share session
    Then both the customer and I see a message that the screen share has ended
    Then the screen sharing session is over
    And both the customer and I are able to continue in our chat conversation
