*** Settings ***
Documentation    Ações, stes e elementos da funcionalide
...              de cadastro de entregador

Library    Browser

*** Keywords ***
Vai pra página de cadastro
    [Arguments]

     Click          css=a[href="/deliver"]    

    Wait For Elements State    form h1    visible    5000
    Get Text    form h1    equal    Cadastre-se para\nfazer entregas

    
Preenche o formulário de cadastro
    [Arguments]    ${buger_var}
    Fill Text                 css=input[name=name]                          ${buger_var}[name]                 
    Fill Text                 css=input[name=cpf]                           ${buger_var}[cpf]                 
    Fill Text                 css=input[name=email]                         ${buger_var}[email]  
    Fill Text                 css=input[name=whatsapp]                      ${buger_var}[wpp]  
    Fill Text                 css=input[name=postalcode]                    ${buger_var}[cep]  

    Click                     css=input[value="Buscar CEP"]
  
    Get Property              css=input[name=address]    value    equal     ${buger_var}[address] 
    Get Property              css=input[name=district]   value    equal     ${buger_var}[district] 
    Get Property              css=input[name=city-uf]    value    equal     ${buger_var}[city-uf] 

    
    Fill Text                 css=input[name=address-number]                ${buger_var}[number]  
    Fill Text                 css=input[name=address-details]               ${buger_var}[details] 
     
   
    Upload File By Selector   css=input[type=file]                          ${EXECDIR}/resources/fixtures/${buger_var}[cnh]
    
submete o formulario de cadastro

    Click                     css=.button-success
    
validação de popup
    [Arguments]    ${expected_text}  
    Wait For Elements State    css=.swal2-html-container     visible    5
    Get Text    css=.swal2-html-container    equal   ${expected_text}

Alert should be
    [Arguments]    ${expected_text}

        Wait For Elements State     css=.alert-error >> text=${expected_text}  
    ...        visible         5
    
    
   