*Settings*
Documentation       Suite de testes para checar informações bancárias

Library         ${EXECDIR}/resources/factories/values.py

Resource        ${EXECDIR}/resources/base.robot

Test Setup      Start Session
Test Teardown   End Session

*Test Cases*

Checking the Account Balance
    [Tags]     balance
    #${balance}      Factory Account Balance

    Go To Home Page 
    Validate Account Balance        R$ 1000

