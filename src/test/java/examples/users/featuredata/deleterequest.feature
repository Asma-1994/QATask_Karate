Feature: QA task for Post Request

  Background:
    * url 'https://reqres.in/'
    
    * def jsonPayLoad = read('../resource/postandputrequest.json')
    * def expectedOutput = read('../resource/allemployee.json')
    * header Content-type = 'application/json'
    
    
 @Regression     
 Scenario: Delete a user information and validate response code
    Given path '/api/products/3'
    When method DELETE
    Then status 204
    Then print response