Feature: Loguearse y obtener token
  Background:
    * url 'http://134.209.211.10:4001'
    * def rqlogin = read ("classpath:/bdd/task1/json/login.json")

  @Prueba1
  Scenario: Obtener token usuario 1
    * def usuario1 = registros.usuario1
    * def idUser1 = registros.idRegistrado1
    * def phone1 = registros.phone1Registrado
    * print phone1

    Given path '/auth/v1/login'
    * header x-channel = 'WEB'
    * set rqlogin.phone = phone1
    And request rqlogin
    When method post
    Then status 200
    And print response

    * def token1 = response.token
    * def authorization1 = 'Bearer ' + token1
    * print authorization1
    #* header Authorization = authorization1

  @Prueba2
  Scenario: Obtener token usuario 2
    * def usuario2 = registros.usuario2
    * def idUser2 = registros.idRegistrado2
    * def phone2 = registros.phone2Registrado
    * print phone2

    Given path '/auth/v1/login'
    * set rqlogin.phone = phone2
    And request rqlogin
    When method post
    Then status 200
    And print response

    * def token2 = response.token
    * def authorization2 = 'Bearer ' + token2
    * print authorization2
    #* header Authorization = authorization1
