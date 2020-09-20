Feature: QA task

  Background:
    * url 'http://dummy.restapiexample.com'
    
    * def expectedOutput = read('../resource/allemployee.json')
    
@GetRequest
@Regression  
  Scenario: get all users and validate Json response,status field,data array and error field not present
    Given path '/api/v1/employees'
    When method get
    Then status 200
    Then print response
    And match response == expectedOutput[0]
    And response.status == 'success'
    And response.data != null
  
    
@GetRequest2
@Regression  
   Scenario: Validate user data received for user 1 from json file
    Given path '/api/v1/employee/1'
    When method get
    Then status 200
    Then print response
    And match response == expectedOutput[1]
    * def error_data = response.error
    And match error_data == null
 
   