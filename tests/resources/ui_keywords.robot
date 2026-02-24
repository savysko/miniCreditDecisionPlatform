*** Settings ***
Library    Browser
Resource   variables.robot

*** Keywords ***
Open Dashboard
    New Browser    chromium    headless=False    slowMo=300ms
    New Context
    New Page    ${BASE_URL}/index.html

Navigate To Loan Page
    Click    id=btn-new-loan

Submit Loan Application
    [Arguments]    ${customer}    ${amount}    ${duration}
    Fill Text    id=customer-id    ${customer}
    Fill Text    id=loan-amount    ${amount}
    Fill Text    id=loan-duration    ${duration}
    Click    id=submit-loan-btn

Verify Loan Submission Successful
    Wait For Elements State    id=loan-result    visible
    ${text} =    Get Text    id=loan-result
    Should Contain    ${text}    Loan ID