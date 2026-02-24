*** Settings ***
Library    RequestsLibrary
Resource   variables.robot

*** Keywords ***
Create API Session
    Create Session    credit_api    ${API_URL}

Submit Loan Via API
    [Arguments]    ${customer}    ${amount}    ${duration}
    ${body}=    Create Dictionary
    ...    customerId=${customer}
    ...    amount=${amount}
    ...    durationMonths=${duration}
    ${response}=    POST On Session    credit_api    /loan    json=${body}
    Should Be Equal As Integers    ${response.status_code}    200
    RETURN    ${response.json()}

Get Decision Via API
    [Arguments]    ${loan_id}
    ${response}=    GET On Session    credit_api    /decision/${loan_id}
    Should Be Equal As Integers    ${response.status_code}    200
    RETURN    ${response.json()}