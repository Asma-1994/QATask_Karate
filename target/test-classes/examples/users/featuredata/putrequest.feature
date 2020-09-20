
Feature: QA task for Put Request

  Background:
    * url 'https://reqres.in/'
    
    * def jsonPayLoad = read('../resource/postandputrequest.json')
    * def expectedOutput = read('../resource/allemployee.json')
    * header Content-type = 'application/json' 

@PutRequest
@Regression  
 Scenario: Update a user information and validate response
    Given path '/api/users/2'
    And request jsonPayLoad[1]
    When method PUT
    Then status 200
    Then print response
     And match response == expectedOutput[3] 