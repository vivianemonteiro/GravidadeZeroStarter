*Settings*
Documentation   Ações customizadas do Nbabank

Library     Browser
Library     String

Resource    actions.robot

*Keywords*
Go To Home Page
    Go To       ${BASE_URL}
    
    Wait For Elements State     css=.carousel       visible     5

Validate Account Balance
    [Arguments]     ${acc_blc}
    ${element}      Set Variable        xpath=//a[contains(text(),"${acc_blc}")]
    
    Wait For Elements State             ${element}          visible         5   
    Get Text                            ${element}          contains        ${acc_blc}
Go To Pix Page
    Click       text=Fazer PIX
    Wait For Elements State         css=.modal-card         visible         5

Fill The Pix Form
    [Arguments]     ${pix_information}

    Select Options By           css=.field select       text       ${pix_information}[bank]
    Fill Text                    id=chave-pix            ${pix_information}[key]
    Fill Text                   id=valor                 ${pix_information}[value]

Submit Pix
   Click             css=button >> text=Enviar PIX  

Check the Transaction   
    [Arguments]     ${pix_information}

    ${element}      Set Variable        xpath=//td[contains(text(), "${pix_information}[key]")]/.. 
    
    Wait For Elements State             ${element}         visible         5   
    Get Text                            ${element}      contains        ${pix_information}[value] 

The Alert Message Should Be
    [Arguments]     ${message}
    ${element}      Set Variable        css=.media-content

    Wait For Elements State     ${element}      visible     5
    Get Text                    ${element}      equal       ${message}


