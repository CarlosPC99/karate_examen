Feature: Asignar Saldo y Validar
  Background:
    * url 'http://134.209.211.10:4002'

    * def token1 = call read('classpath:bdd/task1/getToken.feature@Prueba1')
    * def token2 = call read('classpath:bdd/task1/getToken.feature@Prueba2')

  @Prueba3
  Scenario: Recargar saldo usuario 1
    Given path '/wallet/v1/deposit'
    And header Authorization = token1.authorization1
    And header x-channel = 'WEB'
    And request
    """
      {
        "amount": 50
      }
    """
    When method post
    Then status 200
    And print response

    # Validar que el saldo sea mayor a 45 para hacer la operacion
    Given path '/wallet/v1/balance'
    And header Authorization = token1.authorization1
    And header x-channel = 'WEB'

    When method get
    Then status 200
    And print response
    #And print response.balance
    * def saldo_user1 = response.balance
    And assert response.balance > 44


  @Prueba4
  Scenario: Recargar saldo usuario 2
    Given path '/wallet/v1/deposit'
    And header Authorization = token2.authorization2
    And header x-channel = 'WEB'
    And request
    """
      {
        "amount": 45
      }
    """
    When method post
    Then status 200
    And print response

    #validar que el saldo sea mayor a 45 para hacer la operacion
    Given path '/wallet/v1/balance'
    And header Authorization = token2.authorization2
    And header x-channel = 'WEB'

    When method get
    Then status 200
    And print response
    #And print response.balance
    * def saldo_user2 = response.balance
    And assert response.balance > 44