Feature: Chat: Messaging
    In order to add functionality to the collaborate client
    As a business user
    I want to talk to other people

    Background:
        Given I am a user logged into collaborate

    Scenario: Basic Chat Message Can be Sent and Received in Room
      And a second user logs into collaborate
      When I message the second user as the first user
      Then the second user should get the message
