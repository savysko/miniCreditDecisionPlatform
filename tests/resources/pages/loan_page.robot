*** Settings ***
Resource    base_page.robot

*** Keywords ***
Fill Loan Form
    [Arguments]    ${customer}    ${amount}    ${duration}
    Log    Filling loan form for ${customer}
    Input Text    id=customer-id    ${customer}
    Input Text    id=loan-amount    ${amount}
    Input Text    id=loan-duration    ${duration}

Submit Loan
    Log    Submitting loan
    Click Element    id=submit-loan-btn

Verify Loan Submission Result
    Wait Until Visible    id=loan-result
    ${text}=    Get Text    id=loan-result
    Should Match Regexp    ${text}    Loan ID: .+ Status: PROCESSING
    Capture Checkpoint Screenshot