#Reconciled with TCDB on GIMPY at 10/17/2017 2:49:44 PM
@Tcdb.TestSuiteId=3453 @acd_email @acd_email_interactions
Feature: ACD Email: Functionality of ACD Email UI
    Verifies functionality and handling of ACD Emails through the UI.

    Background:
        Given I am an agent logged into collaborate
        And I have an InboundRoute attached to a new queue with an email timeout of 30 seconds
        And I am on queue without a station associated

  #---------------------CRITICAL ACD EMAIL------------------------#
    @automated @p1 @Tcdb.TestCaseId=47124 @critical
    Scenario:  Agent able to receive and respond to email
      Given An email from "WillyNilly" is sent to my queue
      And 1 email interaction card becomes available in my ACD Interactions List
      When I answer the email from "WillyNilly"
      Then I am able to view the selected active email pane
      When I open the response panel
      Then the response panel becomes available
      When I enter the text "Dominic Farolino was here" into the response panel HTML body
      When I select the send response button
      Then the wrap up codes pane is automatically opened
      And no toast notifications are displayed in the browser
