*** Settings ***
Resource    base_page.robot

*** Keywords ***
Open Loan Section
    Log    Navigating to Loan Page
    Click Element    id=btn-new-loan