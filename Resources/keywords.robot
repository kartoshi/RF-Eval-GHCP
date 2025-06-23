*** Settings ***
Library    Browser
Resource   variables.robot

*** Keywords ***
Open Browser And Navigate
[Arguments]    ${URL}
    New Browser    ${BROWSER}    headless=${HEADLESS}
    New Page       ${URL}
    Get Url        ==    ${URL}

Close Test Browser
    Close Browser

Check Website Title
[Arguments]    ${URL}    ${EXPECTED_TITLE}
    New Page    ${URL}
    Get Title    ==    ${EXPECTED_TITLE}
    Close Page