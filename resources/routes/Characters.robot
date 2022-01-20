*** Settings ***
Documentation       Ações da rota /characters

*** Keywords ***
POST New Characters
    [Arguments]     ${payload}

    ${response}         POST         
    ...                 ${API_URL}/characters        
    ...                 json=${payload}
    ...                 headers=${HEADERS}
    ...                 expected_status=any

    [Return]            ${response}