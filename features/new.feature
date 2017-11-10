#Reconciled with TCDB on GIMPY at 8/15/2017 10:09:41 AM
@Tcdb.TestSuiteId=3222 @Tcdb.TestPlanId=336 @acd_call_general
Feature: ACD: Call
    In order to provide professional customer service
    As an agent
    I want to be able to place, receive and properly handle call interactions

    Background:
        Given I am an agent logged into collaborate

    #------------------CRITICAL ACD CALL------------------#

    @automated @p1 @Tcdb.TestCaseId=46034 @critical @smoke-acd-call
    Scenario: I can receive and control an ACD call
      Given a queue admin has added me to this queue with with a call alerting timeout of 90 seconds
      And I am on queue and can receive a simulated call
      # Navigate away from interactions page to see alert
      And I am viewing the chat panel
      When I receive a call through the queue from a simulated customer without answering
      Then I see only 1 alerting interaction notification
      And I do not auto-navigate to the interactions view
      And the interactions badge shows a current interaction
      When I open the interactions pane from the alerting interaction notification
      Then I am on the interactions pane
      And my call is connected with the simulated customer
      When I mute the acd call
      Then the acd call is muted
      When I unmute the acd call
      Then the acd call is unmuted
      When I place an acd call on hold
      Then the acd call is placed on hold
      When I place an acd call off hold
      Then the acd call is placed off hold
      When I disconnect an acd call
      And the acd call is disconnected
      Then the wrap up codes pane is open
      And I select done in the wrap up codes pane
      And I see no interactions
      And the interactions badge shows no current interactions

    @automated @p1 @Tcdb.TestCaseId=45775 @critical
    Scenario: I can Place a Call to a Customer On Behalf of a Queue
      Given a queue admin has added me to my new queue
      When I place an acd call on behalf of a queue to a simulated customer
      Then my call is connected to the simulated customer's number
      When I disconnect an acd call
      And the acd call is disconnected
      Then the wrap up codes pane is open
      And I select done in the wrap up codes pane
      And I see no interactions
