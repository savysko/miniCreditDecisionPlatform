*** Settings ***
Library    Browser

*** Keywords ***
Wait Until Visible
    [Arguments]    ${locator}
    Wait For Elements State    ${locator}    visible    timeout=5s

Click Element
    [Arguments]    ${locator}
    Wait Until Visible    ${locator}
    Click    ${locator}

Input Text
    [Arguments]    ${locator}    ${value}
    Wait Until Visible    ${locator}
    Fill Text    ${locator}    ${value}

Capture Checkpoint Screenshot
    Take Screenshot