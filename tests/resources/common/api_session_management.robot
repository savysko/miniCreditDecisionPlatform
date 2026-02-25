*** Settings ***
Library    RequestsLibrary
Resource   ../config/variables.robot

*** Keywords ***
Start API Session
    Create Session    loan_api    ${API_URL}

Close API Session
    Delete All Sessions