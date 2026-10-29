Feature: Registrar usuarios
  Background:
    * url 'http://134.209.211.10:4001'

    * header x-channel = 'WEB'
    * def rqlogin = read ("classpath:/bdd/task1/json/login.json")
    * def rquser = read ("classpath:/bdd/task1/json/user.json")
    * def responseUser = read ("classpath:/bdd/task1/json/userResponse.json")

    * def phone1 = '9' + Math.floor(10000000 + Math.random() * 90000000).toString()
    * def phone2 = '9' + Math.floor(10000000 + Math.random() * 90000000).toString()
    * def fullName1 = 'Carlos Puican test ' + phone1
    * def fullName2 = 'Carlos Puican test ' + phone2
    * def email1 = 'test_' + phone1 + '@gmail.com'
    * def email2 = 'test_' + phone2 + '@gmail.com'


  @RegistroUsuarios
  Scenario: Escenario 1 -> Registro de Usuarios

    #Registro Usuario 1
    Given path '/auth/v1/register'
    * header x-channel = 'WEB'
    * set rquser.phone = phone1
    * set rquser.fullName = fullName1
    * set rquser.email = email1
    And request rquser
    When method post
    Then status 201
    And print response

    * def usuario1 = response
    * def phone1Registrado = usuario1.user.phone
    * print usuario1
    * print phone1Registrado

    #Registro Usuario 2
    Given path '/auth/v1/register'
    * header x-channel = 'WEB'
    * set rquser.phone = phone2
    * set rquser.fullName = fullName2
    * set rquser.email = email2
    And request rquser
    When method post
    Then status 201
    And print response

    * def usuario2 = response
    * def phone2Registrado = usuario2.user.phone
    * print usuario2
    * print phone2Registrado


