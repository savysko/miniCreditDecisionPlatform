*** Settings ***
Resource    ../resources/common/api_session_management.robot
Resource    ../resources/business/loan_api_business.robot
Resource    ../resources/config/variables.robot

Suite Setup     Start API Session
Suite Teardown  Close API Session

*** Test Cases ***
API Loan Submission
    [Tags]    api    smoke
    ${loan_id}=    Submit Loan And Validate
    ...    ${CUSTOMER_ID}
    ...    ${LOAN_AMOUNT}
    ...    ${LOAN_DURATION}

API Decision Retrieval
    [Tags]    api    regression
    ${loan_id}=    Submit Loan And Validate
    ...    ${CUSTOMER_ID}
    ...    ${LOAN_AMOUNT}
    ...    ${LOAN_DURATION}
    Retrieve Decision And Validate    ${loan_id}