*** Settings ***
Resource    ../resources/api_keywords.robot

*** Test Cases ***
Loan Submission API Test
    [Tags]    api    regression
    Create API Session
    ${loan}=    Submit Loan Via API    ${CUSTOMER_ID}    ${LOAN_AMOUNT}    ${LOAN_DURATION}
    Should Not Be Empty    ${loan["loanId"]}

Decision Retrieval API Test
    [Tags]    api    regression
    Create API Session
    ${loan}=    Submit Loan Via API    ${CUSTOMER_ID}    ${LOAN_AMOUNT}    ${LOAN_DURATION}
    ${decision}=    Get Decision Via API    ${loan["loanId"]}
    Should Contain    ${decision["decision"]}    REVIEW