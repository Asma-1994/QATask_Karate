Feature: QA task for Post Request

  Background:
    * url 'https://reqres.in/'
    
    * def jsonPayLoad = read('../resource/postandputrequest.json')
    * def expectedOutput = read('../resource/allemployee.json')
    * header Content-type = 'application/json'
    
 @Regression
  Scenario: Create a user and validate response
    Given path '/api/users'
    And request jsonPayLoad[0]
    And param delay = 3 
    When method POST
    Then status 201
    Then print response
     And match response == expectedOutput[2] 
 
 @Regression
 Scenario: Update a user information and validate response
    Given path '/api/users/2'
    And request jsonPayLoad[1]
    When method PUT
    Then status 200
    Then print response
     And match response == expectedOutput[3] 
     
@Regression     
 Scenario: Delete a user information and validate response code
    Given path '/api/products/3'
    When method DELETE
    Then status 204
    Then print response