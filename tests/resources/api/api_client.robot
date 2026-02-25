*** Settings ***
Resource    ../common/api_session_management.robot

*** Keywords ***
POST Request
    [Arguments]    ${endpoint}    ${payload}
    ${response}=    Post On Session
    ...    loan_api
    ...    ${endpoint}
    ...    json=${payload}
    RETURN    ${response}

GET Request
    [Arguments]    ${endpoint}
    ${response}=    Get On Session
    ...    loan_api
    ...    ${endpoint}
    RETURN    ${response}