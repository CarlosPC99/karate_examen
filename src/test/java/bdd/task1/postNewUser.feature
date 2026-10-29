Feature: crear usuarios
  Background:
    * url 'http://134.209.211.10:4001'
    * def requests = read ("classpath:/bdd/pet/json/user.json")
    * def datos = read('user.json')
    * def phone = '9' + Math.floor(10000000 + Math.random() * 90000000).toString()
    * set datos.phone = phone
  @Prueba1
  Scenario: Crear usuario
    Given path '/auth/v1/register'
    * request requests
    When method post
    Then status 200
    #* def responseName = 'Cat 3'
    #And match response.name == responseName
    #And print response