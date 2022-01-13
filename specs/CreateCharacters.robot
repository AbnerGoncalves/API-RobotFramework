*** Settings ***
Documentation       Suite de Testes do cadastro de personagens na API da Marvel 

Resource    ${EXECDIR}/resources/Keywords/base.robot

Library     ${EXECDIR}/resources/factores/Abner.py

*** Test Cases ***
Deve cadastrar um personagem

    Set Client Key      toninhoaiaiai@gmail.com

    &{personagem}       Factory Abner

    ${response}         POST        
    ...                 ${API_URL}/characters        
    ...                 json=${personagem}
    ...                 headers=${headers}

    Status Should Be        200
