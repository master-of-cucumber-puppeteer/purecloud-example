#Reconciled with TCDB on GIMPY at 8/15/2017 10:09:30 AM
@Tcdb.TestSuiteId=3385 @Tcdb.TestPlanId=336 @acd_chat_general
Feature: ACD: Chat
    In order to provide professional customer service
    As an agent
    I want to be able to receive and properly handle chat interactions

    Background:
        Given I am an agent logged into collaborate
        And a queue admin has added me to my new queue
        And I am on queue without a station associated

    #---------------------CRITICAL ACD CHAT------------------------#
    @automated @p1 @Tcdb.TestCaseId=45820 @critical @smoke-acd-chat
    Scenario: I can Receive an ACD Chat from a Customer through a Queue
      When a customer starts a chat conversation with me through my queue
      And I accept the chat conversation
      Then both the customer and I see the other as connected
      When both the customer and I send chat messages through my queue
      Then both the customer and I see all of the chat messages in our chat history
      When I disconnect from the chat conversation
      And I select the default wrap up code
      And I exit after call work
      Then the chat interaction is not visible
