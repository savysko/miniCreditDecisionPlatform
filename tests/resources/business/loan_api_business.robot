*** Settings ***
Library     Collections
Resource    ../api/loan_endpoints.robot
Resource    ../api/decision_endpoints.robot

*** Keywords ***
Submit Loan And Validate
    [Arguments]    ${customer}    ${amount}    ${duration}
    ${response}=    Submit Loan
    ...    ${customer}
    ...    ${amount}
    ...    ${duration}

    Status Should Be    200    ${response}

    ${body}=    Set Variable    ${response.json()}
    Dictionary Should Contain Key    ${body}    loanId
    Dictionary Should Contain Key    ${body}    status
    Should Be Equal    ${body['status']}    PROCESSING

    RETURN    ${body['loanId']}

Retrieve Decision And Validate
    [Arguments]    ${loan_id}
    ${response}=    Get Loan Decision    ${loan_id}
    Status Should Be    200    ${response}

    ${body}=    Set Variable    ${response.json()}
    Dictionary Should Contain Key    ${body}    decision