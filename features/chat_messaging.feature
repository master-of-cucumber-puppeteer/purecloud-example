Feature: Chat: Messaging
    In order to add functionality to the collaborate client
    As a business user
    I want to test the instant messaging functionality in collaborate

    Background:
        Given I am a user logged into collaborate

    Scenario: Basic Chat Message Can be Sent and Received in Room
      #Logging in
      Then my presence indicators show that I am "available"

      #Start chat with second user via autocomplete search
      Given a "second" user is logged into collaborate
      When toast messages have been slowed down
      And I switch to the 1st browser
      And I start a conversation with the "second" user
      Then my message is displayed in the chat window

      #Check message received from second user
      When I switch to the 2nd browser
      Then my message appears in a browser notification
      And the user is viewing my conversation
      And my message is displayed in the chat window

      #Mention
      When the "second" user mentions me in the 1-1 chat
      Then I see the message containing the mention in the 1-1 chat

      #Check invite/ search feature
      And a "third" user exists in the same organization
      When I add the "third" user via the invite panel to the current conversation
      Then the "third" user is present in the ad hoc chat room
