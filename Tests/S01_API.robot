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