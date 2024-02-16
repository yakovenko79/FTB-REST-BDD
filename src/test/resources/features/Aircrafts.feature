Feature: Testing FTB REST API AIRCRAFTS resource
  Clients should be able to READ/CREATE/UPDATE/DELETE an aircraft record.

  Scenario: Get specific aircraft data by its ID
    Given FTB is up and running and the tests are configured
    When client gets details of Aircraft id=12
    Then aircraft data to be manufacturer='Su' and model='Su-24' and number of seats=494

  Scenario: Create an aircraft
    Given FTB is up and running and the tests are configured
    When client tries to create an Aircraft having manufacturer="Test" and model="TestModel" and number of seats=11
    Then returned aircraft data to be manufacturer="Test" and model="TestModel" and number of seats=11
    When client gets details of just created Aircraft
    Then aircraft data to be manufacturer="Test" and model="TestModel" and number of seats=11

  Scenario: Create an aircraft with null seats
    Given FTB is up and running and the tests are configured
    When client tries to create an Aircraft having null number of seats, manufacturer="Test" and model="TestModel"
    Then returned aircraft data with null number of seats, manufacturer="Test" and model="TestModel"
    When client gets details of just created Aircraft
    Then aircraft data with null number of seats, manufacturer="Test" and model="TestModel"


  Scenario Outline: Create an aircraft with empty manufacturer
    Given FTB is up and running and the tests are configured
    When client tries to create an Aircraft having manufacturer='<manufacturer>' and model='<model>' and number of seats=<number_of_seats>
    Then returned aircraft data to be manufacturer='<manufacturer>' and model='<model>' and number of seats=<number_of_seats>
    When client gets details of just created Aircraft
    Then aircraft data to be manufacturer='<manufacturer>' and model='<model>' and number of seats=<number_of_seats>

    Examples:
    |manufacturer|model    |number_of_seats|
    |Test        |         |11             |
    |Test        |TestModel|11             |