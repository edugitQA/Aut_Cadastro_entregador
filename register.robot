*** Settings ***
Documentation    suite de teste de cadastro de entregador

Library    Browser


*** Test Cases ***
Deve poder cadastrar um novo entregador

    ${buger_var}            Create Dictionary    
    ...    name=Edu Ferreira
    ...    cpf=00000014141
    ...    email=eduQa@gmail.com
    ...    wpp=61998542685
    ...    cep=73357005
    ...    number=15
    ...    details=apt 01
    ...    address=Quadra 19 Conjunto A
    ...    district=Setor Residencial Leste (Planaltina)
    ...    city-uf=Brasília/DF
    ...    cnh=Mr_bean.png


       
    Vai pra página de cadastro
    Preenche o formulário de cadastro          ${buger_var}
    submete o formulario de cadastro    
    validação de popup                         Recebemos os seus dados. Fique de olho na sua caixa de email, pois e em breve retornamos o contato.


*** Keywords ***

Vai pra página de cadastro
    [Arguments]

    New Browser    browser=chromium    headless=False
    New Page       https://buger-eats.vercel.app/deliver
    
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
     
   
    Upload File By Selector   css=input[type=file]                          ${EXECDIR}/${buger_var}[cnh]

submete o formulario de cadastro

    Click                     css=.button-success
    
validação de popup
    [Arguments]    ${expected_text}  
    Wait For Elements State    css=.swal2-html-container     visible    5
    Get Text    css=.swal2-html-container    equal   ${expected_text}
    
    
    Sleep    5



    