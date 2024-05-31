*** Settings ***
Documentation    Suite de testes de API do site https://reqres.in/api
Resource    ../Resources/API_Resource.robot

*** Test Cases ***

CT01: Realizar uma requisição GET consultando lista de usuários
    [Tags]    S01CT01
    [Documentation]    CARD - XXXX
    Dado que estou conectado na API    users?page=2
    Quando envio a requisição para consultar usuários
    Então a requisição deve ocorrer com sucesso    200
    E deve ser retornado a quantidade de registros corretamente    ${6} 

CT02: Realizar uma requisição POST criando um novo usuário
    [Tags]    S01CT02
    [Documentation]    CARD - XXXX
    Dado que estou conectado na API    users
    Quando envio a requisição para criar um novo usuário
    Então a requisição deve ocorrer com sucesso    201

CT03: Realizar uma requisição PUT alterando job do usuário
    [Tags]    S01CT04
    [Documentation]    CARD - XXXX
    Dado que estou conectado na API    users/2
    Quando envio a requisição para alterar job do usuário
    Então a requisição deve ocorrer com sucesso    200

CT04: Realizar uma requisição DELETE excluindo usuário
    [Tags]    S01CT03
    [Documentation]    CARD - XXXX
    Dado que estou conectado na API    users/2
    Quando envio a requisição para excluir um usuário
    Então a requisição deve ocorrer com sucesso    204