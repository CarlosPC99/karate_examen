Feature: Transferir dinero del usuario 1 al usuario 2
  Background:
    * url 'http://134.209.211.10:4003'
    * header x-channel = 'WEB'
    # Registrar usuarios
    * def registros = callonce read('classpath:bdd/task1/postNewUser.feature@RegistroUsuarios')

    # Obtener tokens
    * def datUser1 = call read('classpath:bdd/task1/getToken.feature@Prueba1')
    * def datUser2 = call read('classpath:bdd/task1/getToken.feature@Prueba2')

    # Asignarle saldos
    * def saldoUser1 = call read('classpath:bdd/task1/postAsignarSaldo.feature@Prueba3')
    * def saldoUser2 = call read('classpath:bdd/task1/postAsignarSaldo.feature@Prueba4')

    * def rqTransfer = read ("classpath:/bdd/task1/json/bodyTransfer.json")


  @Prueba5
  Scenario: Recargar saldo de usuario 1 a usuario 2
    Given path '/transaction/v1/transfer'
    And header Authorization = datUser1.authorization1
    And header x-channel = 'WEB'
    * def id_User2 = datUser2.idUser2
    * def id_User1 = datUser1.idUser1
    * def phone_User2 = datUser2.phone2
    * print saldoUser1.saldo_user1
    * print saldoUser2.saldo_user2
    * set rqTransfer.recipientId = id_User2
    * set rqTransfer.description = 'Prueba de envio de dinero al usuario - id usuario ' + id_User2 + ' phone - ' + phone_User2

    And request rqTransfer

    When method post
    Then status 200
    And print response
