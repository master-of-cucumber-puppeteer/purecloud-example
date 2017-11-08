#Reconciled with TCDB on GIMPY at 8/15/2017 10:09:34 AM
@Tcdb.TestPlanId=279 @Tcdb.TestSuiteId=2970 @call @active_call
Feature: UC: Active Call
    In order to test functionality of the collaborate client
    As a business user
    I want to test the active call functionality

    Background:
        Given I am a unified communications user logged into collaborate

    @p1 @automated @Tcdb.TestCaseId=32366 @critical @smoke-call
    Scenario: Active Internal Call Displays and Controls as Expected
        Given a "second" unified communications user is logged into collaborate
        And I have a personal profile picture
        And the "second" user has a personal profile picture
        And I have called the "second" user
        Then my user interface displays the "second" users name in the participant card
        And my user interface displays the "second" users picture in the participant card
        And my user interface displays the "second" user as online in the participant card
        And my user interface displays the "second" user as active in the participant card
        And a call with the "second" user is displayed in the active calls list
        And the current call can chat with the "second" user
        And the "call" activity indicator is displayed on my profile
        And the "second" users user interface displays my name in the participant card
        And the "second" users user interface displays my picture in the participant card
        And the "second" users interface displays me as online in the participant card
        And the "second" users interface displays me as active in the participant card
        And the "second" users active calls shows a call with me
        And the "call" activity indicator is displayed on the "second" users profile
        And my audio is connected with the "second" user

        # Mute
        When I mute the call via user interface
        Then my user interface displays the call as muted
        And the "second" user can not hear my audio
        When I unmute the call via user interface
        Then my user interface displays the call as unmuted
        And the "second" user can hear my audio

        # Hold
        When I hold the call
        Then my user interface displays the call as held
        And the "second" users user interface displays the call as held
        When I unhold the call via participant card
        Then my user interface no longer displays the call as held
        And the "second" users user interface displays the call as not held

        # End call
        When I end the call after being connected
        Then my user interface displays that I have disconnected from the call with the "second" user
        And the "second" users user interface displays that I have left the call
        And my user interface no longer displays an active call
        And the "second" users user interface no longer displays an active call

    @p1 @automated @Tcdb.TestCaseId=32368 @critical
    Scenario: Active External Call Displays and Controls as Expected
        When I am on a connected call with an external party
        Then my user interface displays the external number in the participant card
        And my user interface displays the "external" user as active in the participant card
        And my user interface displays a generic avatar in the participant card
        And the external call audio verification succeeds

        # Mute
        When I mute the call via user interface
        Then my user interface displays the call as muted
        And the external user can not hear my audio
        When I unmute the call via user interface
        Then my user interface displays the call as unmuted
        And the external user can hear my audio

        #DTMF
        When I open the dialpad menu
        Then the field to enter a name or number is not displayed on the dialpad menu
        When I press any number of keys on the dialpad menu
        Then the corresponding DTMF tones are heard by the external user
        When I select the call with the external party


        # End the call
        And I end the call after being connected
        Then my user interface displays that I have disconnected from the call with the "external" user
        And my user interface no longer displays an active call
