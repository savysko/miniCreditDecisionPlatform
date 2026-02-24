*** Settings ***
Resource    ../resources/ui_keywords.robot
Suite Setup     Open Dashboard
Suite Teardown  Close Browser

*** Test Cases ***
E2E Loan Submission Workflow
    [Tags]    ui    smoke
    Navigate To Loan Page
    Submit Loan Application    ${CUSTOMER_ID}    ${LOAN_AMOUNT}    ${LOAN_DURATION}
    Verify Loan Submission Successful