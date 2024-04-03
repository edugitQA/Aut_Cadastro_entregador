*** Settings ***
Documentation    suite de teste de cadastro de entregador

Resource    ../resources/base.resource
Test Setup       Start Session
Test Teardown    finish session
*** Test Cases ***
Deve poder cadastrar um novo entregador
    [Tags]     smoke
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

Não deve poder cadastrar se o cpf for incorreto

    [Tags]    cpf_inv
    ${buger_var}            Create Dictionary    
    ...    name=vanessa Mendes
    ...    cpf=000000141de
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
    Preenche o formulário de cadastro         ${buger_var}
    submete o formulario de cadastro 
    Alert should be  Oops! CPF inválido 

Não deve poder cadastrar se o email for inválido

    [Tags]    email_inv
    ${buger_var}            Create Dictionary    
    ...    name=Eduardo paulo
    ...    cpf=000000141de
    ...    email=eduQa@gmail
    ...    wpp=61998542685
    ...    cep=73357005
    ...    number=15
    ...    details=apt 01
    ...    address=Quadra 19 Conjunto A
    ...    district=Setor Residencial Leste (Planaltina)
    ...    city-uf=Brasília/DF
    ...    cnh=Mr_bean.png
    
    Vai pra página de cadastro
    Preenche o formulário de cadastro         ${buger_var}
    submete o formulario de cadastro 
    Alert should be  Oops! Email com formato inválido.
       
Não deve cadastrar entregador sem o preenchimento dos campos obrigatorios

    [Tags]    required   

    Vai pra página de cadastro
    submete o formulario de cadastro    
    Alert should be   É necessário informar o nome  
    Alert should be   É necessário informar o CPF
    Alert should be   É necessário informar o email  
    Alert should be   É necessário informar o CEP  
    Alert should be   É necessário informar o número do endereço  
    Alert should be   Adicione uma foto da sua CNH
   
Deve poder cadastrar entregador que utiliza moto
    [Tags]   categoria
    ${buger_var}            Create Dictionary    
    ...    name=Edu Ferreira
    ...    cpf=00000014141
    ...    email=QAE@gmail.com
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
    categorias de entrega                      Moto
    submete o formulario de cadastro    
    validação de popup                         Recebemos os seus dados. Fique de olho na sua caixa de email, pois e em breve retornamos o contato.

Deve poder cadastrar entregador que utiliza Bicicleta
    [Tags]   categoria
    ${buger_var}            Create Dictionary    
    ...    name=henri leo
    ...    cpf=00000014141
    ...    email=henri@gmail.com
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
    categorias de entrega                      Bicicleta
    submete o formulario de cadastro    
    validação de popup                         Recebemos os seus dados. Fique de olho na sua caixa de email, pois e em breve retornamos o contato.

 Deve poder cadastrar entregador que utiliza van/carro
    [Tags]   categoria
    ${buger_var}            Create Dictionary    
    ...    name=marlon gomes
    ...    cpf=00000014141
    ...    email=marlo@gmail.com
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
    categorias de entrega                      Van/Carro
    submete o formulario de cadastro    
    validação de popup                         Recebemos os seus dados. Fique de olho na sua caixa de email, pois e em breve retornamos o contato.   