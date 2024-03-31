*** Settings ***
Documentation    suite de teste de cadastro de entregador

Resource    ../resources/base.resource


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
    

       
    Start Session
    Vai pra página de cadastro
    Preenche o formulário de cadastro          ${buger_var}
    submete o formulario de cadastro    
    validação de popup                         Recebemos os seus dados. Fique de olho na sua caixa de email, pois e em breve retornamos o contato.
    finish session






    