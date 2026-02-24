*** Settings ***
Resource    ../resources/common/browser_management.robot
Resource    ../resources/business/loan_business.robot
Resource    ../resources/config/variables.robot

Suite Setup     Start Browser Session
Suite Teardown  Close Browser Session

*** Test Cases ***
E2E Loan Submission Workflow
    [Tags]    ui    smoke
    Execute Loan Submission Flow
    ...    ${CUSTOMER_ID}
    ...    ${LOAN_AMOUNT}
    ...    ${LOAN_DURATION}