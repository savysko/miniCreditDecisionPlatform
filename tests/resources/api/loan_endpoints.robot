*** Settings ***
Library     Collections
Resource    api_client.robot

*** Keywords ***
Create Loan Request
    [Arguments]    ${customer}    ${amount}    ${duration}
    ${payload}=    Create Dictionary
    ...    customerId=${customer}
    ...    amount=${amount}
    ...    durationMonths=${duration}
    RETURN    ${payload}

Submit Loan
    [Arguments]    ${customer}    ${amount}    ${duration}
    ${payload}=    Create Loan Request
    ...    ${customer}
    ...    ${amount}
    ...    ${duration}
    ${response}=    POST Request    /loan    ${payload}
    RETURN    ${response}