*** Settings ***
Documentation    Suite de Testes do cadastro de personagens na API da Marvel 

Resource         ${EXECDIR}/resources/Keywords/base.robot
Resource         ${EXECDIR}/resources/routes/Characters.robot

Library          ${EXECDIR}/resources/factores/Abner.py
Library          ${EXECDIR}/resources/factores/Joao.py

Test Setup       Run Keywords       Set Client Key      toninhoaiaiai@gmail.com
...              AND                Back To The Past

*** Test Cases ***
Deve cadastrar um personagem

    &{personagem}    Factory Abner
    ${response}      POST New Characters    ${personagem}

    Status Should Be    200    ${response}

Não deve cadastrar com o mesmo nome

    &{personagem}          Factory Joao
    POST New Characters    ${personagem} 

    ${response}    POST New Characters    ${personagem}


    Status Should Be    409                          ${response}
    Log To Console      ${response.json()}[error]    Character already exists :(