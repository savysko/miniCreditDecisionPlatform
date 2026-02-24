*** Settings ***
Library    Browser
Resource   ../config/variables.robot

*** Keywords ***
Start Browser Session
    New Browser    ${BROWSER}    headless=${HEADLESS}    slowMo=${SLOWMO}
    New Context
    New Page    ${BASE_URL}/index.html
    Set Browser Timeout    5s

Close Browser Session
    Close Browser