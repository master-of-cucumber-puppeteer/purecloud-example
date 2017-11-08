Feature: Purecloud Login
As a product manager
I want users to be authenticated before using the product
So that only registered users have access

Scenario: User logs in
Given I navigate to "https://apps.mypurecloud.com"
When I type "agent@cobrowsedev.inin" into "#email"
And I type "CobrowseTest1234!" into "#password"
And I click ".btn-login"
Then "available" is contained in the class of the element with selector ".entity-mini-card-container"
When I click ".full-width-image.entity-person"
And I click ".selectable.logout-entry"
Then "btn-login" is contained in the class of the element with selector ".btn.btn-primary"
