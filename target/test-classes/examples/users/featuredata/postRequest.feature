Feature: QA task for Post Request

  Background:
    * url 'https://reqres.in/'
    
    * def jsonPayLoad = read('../resource/postandputrequest.json')
    * def expectedOutput = read('../resource/allemployee.json')
    * header Content-type = 'application/json'
    
 @PostRequest
 @Regression  
  Scenario: Create a user and validate response
    Given path '/api/users'
    And request jsonPayLoad[0]
    And param delay = 3 
    When method POST
    Then status 201
    Then print response
     And match response == expectedOutput[2] 
 