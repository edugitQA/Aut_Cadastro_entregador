*** Settings ***
Documentation    suite de teste de cadastro de entregador
Library    Browser


*** Test Cases ***
Deve poder cadastrar um novo entregador

    ${name}                 Set Variable      Edu Alves
    ${cpf}                  Set Variable      00000014141
    ${email}                Set Variable      eduQa@gmail.com
    ${wpp}                  Set Variable      61998542685
    ${cep}                  Set Variable      73357005
    ${address-number}       Set Variable      15
    ${address-details}      Set Variable      apt 01 
    ${address}              Set Variable      Quadra 19 Conjunto A
    ${district}             Set Variable      Setor Residencial Leste (Planaltina)      
    ${city-uf}              Set Variable      Brasília/DF



    New Browser    browser=chromium    headless=False
    New Page       https://buger-eats.vercel.app/deliver
    
    Wait For Elements State    form h1    visible    5000
    Get Text    form h1    equal    Cadastre-se para\nfazer entregas
    
    
    Fill Text                 css=input[name=name]                          ${name}                  
    Fill Text                 css=input[name=cpf]                           ${cpf}                  
    Fill Text                 css=input[name=email]                         ${email}  
    Fill Text                 css=input[name=whatsapp]                      ${wpp}  
    Fill Text                 css=input[name=postalcode]                    ${cep}  

    Click                     css=input[value="Buscar CEP"]
    #validando preenchimento automático do cep
    Get Property              css=input[name=address]    value    equal     ${address}  
    Get Property              css=input[name=district]   value    equal     ${district}  
    Get Property              css=input[name=city-uf]    value    equal     ${city-uf}  

    #Finalizando preenchimento do cep
    Fill Text                 css=input[name=address-number]                ${address-number}  
    Fill Text                 css=input[name=address-details]               ${address-details}  
     
    #inserindo arquivo de imagem
    Upload File By Selector   css=input[type=file]                          ${EXECDIR}/Mr_bean.png
    
    Click                     css=.button-success
    
    #validando texto pós clique de cadastro
    Wait For Elements State    css=.swal2-html-container     visible    5
    Get Text    css=.swal2-html-container    equal    Recebemos os seus dados. Fique de olho na sua caixa de email, pois e em breve retornamos o contato.
    
    
    Sleep    5



    