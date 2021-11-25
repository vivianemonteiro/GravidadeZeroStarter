*Settings*
Documentation       Suite de testes para realizar transações bancárias

Library         ${EXECDIR}/resources/factories/values.py

Resource        ${EXECDIR}/resources/base.robot

Test Setup      Start Session
Test Teardown   End Session

*Test Cases*

### Cenario 2: Fazer PIX
# Dado que meu saldo é de R$ 1000
# E acesso a home nBank
# Quando faço um PIX no valor de R$ 100
# Então meu saldo final deve ser de R$ 900
# E a transação em questão é adicionada no meu Extrato
Send Pix
    [Tags]     send_pix
    ${pix_information}      Factory Send Pix

    Go To Home Page 
    Validate Account Balance        ${INITIAL_VALUE}
    Go To Pix Page
    Fill The Pix Form               ${pix_information}
    Submit Pix
    Validate Account Balance        R$ 900
    Check the Transaction           ${pix_information}    




### Cenario 3: PIX com valor ZERO
# Dado que meu saldo é de R$ 1000
# E acesso a home nBank
# Quando faço um PIX no valor de R$ 0
# Então vejo a mensgem de alerta "Oops. Transferir ZERO é osso hein..."
Send Pix With Value 0
    [Tags]     send_pix_zero
    ${pix_information}      Factory Send Pix Zero

    Go To Home Page 
    Validate Account Balance             ${INITIAL_VALUE}
    Go To Pix Page
    Fill The Pix Form                    ${pix_information}
    Submit Pix
    The Alert Message Should Be          Oops. Transferir ZERO é osso hein... 

### Cenario 4: PIX com valor NEGATIVO
# Dado que meu saldo é de R$ 1000
# E acesso a home nBank
# Quando faço um PIX no valor de R$ -1
# Então vejo a mensgem de alerta "Oops. Valor para PIX incorreto..."
Send Pix With Value Negative Value
    [Tags]     send_pix_negative
    ${pix_information}      Factory Send Pix Negative

    Go To Home Page 
    Validate Account Balance             ${INITIAL_VALUE}
    Go To Pix Page
    Fill The Pix Form                    ${pix_information}
    Submit Pix
    The Alert Message Should Be          Oops. Valor para PIX incorreto... 