Feature: Manage All
 In order to make an contactbook
 As a author
 I want to create and manage users and their contacts
 
   Scenario Outline: sign up new user
    Given I am sign up as "<login>" with email "<email>" and password "<password>"
    Then I should see "You are logged in as <login>"
    
    Examples:
      | login   | email       | password    |
      | biguser | big@mail.ru | bigpassword |
	  | small | small@gmail.com | smallpassword |
	  
	  
	  
  Scenario Outline: log in after sign up and logout
    Given I am sign up as "<login>" with email "<email>" and password "<password>"
    Then I should see "You are logged in as <login>"
    When I follow "Logout"
    Then I should see "You have been logged out"
    When I press "Log in"
    Given I am filling login form with Login "<login>" and Password "<password>"
    Then I should see "You are logged in as <login>"
    Examples:
      | login   | email       | password    |
      | biguser | big@mail.ru | bigpassword |
      
      
         Scenario Outline: create new contact
    Given I am sign up as "<login>" with email "<email>" and password "<password>"
    Then I should see "You are logged in as <login>"
    When I follow "Your contactbook"
    And I press "New contact"
    Given I am filling contact form with Name "<contact_name>", Lastname "<contact_lastname>", Firstname "<contact_firstname>", Middlename "<contact_middlename>", Email "<email>", Phone number "<phone_number>", Address "<address>"
    Then I should see "Show contact"
    Examples:
      | login   | email       | password    | contact_name | contact_lastname | contact_firstname | contact_middlename | contact_email | contact_phone_number | contact_address |
      | biguser | big@mail.ru | bigpassword | | Ivanov | Sidor | Petrovich | ivanov@gmail.com | 1234567 | ul.New-Yorkskaya |

     Scenario Outline: create, edit and destroy contact
    Given I am sign up as "<login>" with email "<email>" and password "<password>"
    Then I should see "You are logged in as <login>"
    And I should have 0 contact of User "<login>"
    When I follow "Your contactbook"
    And I press "New contact"
    Given I am filling contact form with Name "<contact_name>", Lastname "<contact_lastname>", Firstname "<contact_firstname>", Middlename "<contact_middlename>", Email "<email>", Phone number "<phone_number>", Address "<contact_address>"
    Then I should see "Show contact"
    When I follow "Edit"
    Then I should see "Editing contact"
    Given I am filling contact form with Name "<contact_new_name>", Lastname "<contact_lastname>", Firstname "<contact_firstname>", Middlename "<contact_middlename>", Email "<email>", Phone number "<contact_new_phone_number>", Address "<contact_address>"
    Then I should see "Contact was successfully updated"
    Then I should have 1 contact of User "<login>"
    When I follow "Destroy"
    Then I should have 0 contact of User "<login>"
    Examples:
      | login   | email       | password    | contact_name | contact_lastname | contact_firstname | contact_middlename | contact_email | contact_phone_number | contact_address | contact_new_name | contact_new_phone_number |
      | biguser | big@mail.ru | bigpassword | | Ivanov | Sidor | Petrovich | ivanov@gmail.com | 1234567 | ul.New-Yorkskaya | my friend Petrov | 722222 |

Scenario: Count users
	Then I count "user"
	Then I count "kontakt"
	Then I count "tag"
