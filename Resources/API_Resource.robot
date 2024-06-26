*** Settings ***
Documentation    Suite de testes de API do site https://reqres.in/api
Library    RequestsLibrary

*** Variables ***
${URL}    https://reqres.in/api

*** Keywords ***
# --- DADO ---
Dado que estou conectado na API  
    [Arguments]    ${FINAL_ENDPOINT} 
    ${ALIAS}    Create Session    alias=lista_users    url=${URL}/${FINAL_ENDPOINT}
    Session Exists    alias=lista_users

# --- QUANDO ---
Quando envio a requisição para consultar usuários
    ${RESPONSE}    GET On Session    alias=lista_users    url=${URL}/users?page=2
    Set Test Variable    ${RESPONSE}

Quando envio a requisição para criar um novo usuário
    ${DADOS}    Create Dictionary    name=Mirian    job=QA
    ${RESPONSE}    POST    ${URL}/users/${DADOS}

Quando envio a requisição para excluir um usuário
    ${RESPONSE}    DELETE    url=${URL}/users/2

Quando envio a requisição para alterar job do usuário
    ${DADOS}    Create Dictionary    name=Mirian    job=Tester
    ${RESPONSE}    PUT    ${URL}/users/5/${DADOS}

# --- ENTÃO ---
Então a requisição deve ocorrer com sucesso    
    [Arguments]    ${status_code}
    Status Should Be    ${status_code}

# --- E ---
E deve ser retornado a quantidade de registros corretamente    
    [Arguments]    ${qtde_esperada}
    ${qtde_retornada}    Get Length    ${RESPONSE.json()['data']}
    Should Be Equal    ${qtde_esperada}    ${qtde_retornada}