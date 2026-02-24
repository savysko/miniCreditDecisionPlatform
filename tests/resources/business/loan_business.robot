*** Settings ***
Resource    ../pages/dashboard_page.robot
Resource    ../pages/loan_page.robot

*** Keywords ***
Execute Loan Submission Flow
    [Arguments]    ${customer}    ${amount}    ${duration}
    Open Loan Section
    Fill Loan Form    ${customer}    ${amount}    ${duration}
    Submit Loan
    Verify Loan Submission Result