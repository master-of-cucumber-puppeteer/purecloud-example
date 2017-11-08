``#Reconciled with TCDB on GIMPY at 8/15/2017 10:09:31 AM
@Tcdb.TestSuiteId=3383 @Tcdb.TestPlanId=336 @acd_call_transfer

Feature: ACD: Call Transfer
    In order to get customers to the proper party for their needs
    As an agent
    I want to be able to transfer a call interaction to another agent

    Background:
        Given I am an agent logged into collaborate
        And a queue admin has added me to my new queue
        And I am on queue and can receive a simulated call
        And I receive a call through the queue from a simulated customer

    #------------------CRITICAL TRANSFER---------------------#
    @p1 @automated @Tcdb.TestCaseId=45797 @critical
    Scenario: I can make and receive a blind transferred interaction
      Given a "3rd" agent exists and is online and can receive simulated calls
      And the "3rd" agent navigates to the acd interactions pane
      When I blind transfer the ACD call to "3rd" agent
      Then the "3rd" agent is able to continue the phone call with the customer
      And the "3rd" agent's call is connected with the simulated customer
      And my wrap up codes pane is automatically opened
      When I select done in the wrap up codes pane
      When the "3rd" agent blind transfers the ACD call to me
      And I answer the acd call via user interface
      And I hang up my call with a customer
      When I select done in the wrap up codes pane
      Then the current interaction goes away
      And the "3rd" agent selects done in the wrap up codes pane
      When the "3rd" user searches for me via autocomplete search
      And the "acd call" activity indicator is not displayed in the autocomplete search result

    @p1 @automated @Tcdb.TestCaseId=49115 @critical
    Scenario: I can Consult Transfer an ACD Call to Another Agent
      Given a "3rd" agent exists and is online and can receive simulated calls
      And the "3rd" agent navigates to the acd interactions pane
      When I consult transfer the acd call to "3rd" agent
      And I complete my acd consult call transfer
      Then the "3rd" agent is able to continue the phone call with the customer
      And the "3rd" agent's call is connected with the simulated customer
      And my wrap up codes pane is automatically opened
