*** Settings ***
Resource    base_page.robot

*** Keywords ***
Retrieve Decision
    [Arguments]    ${loan_id}
    Input Text    id=loan-id-input    ${loan_id}
    Click Element    id=get-decision-btn

Verify Decision Visible
    Wait Until Visible    id=decision-result
    Capture Checkpoint Screenshot