*** Settings ***
Resource    api_client.robot

*** Keywords ***
Get Loan Decision
    [Arguments]    ${loan_id}
    ${response}=    GET Request    /decision/${loan_id}
    RETURN    ${response}