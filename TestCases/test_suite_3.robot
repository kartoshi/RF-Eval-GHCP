*** Settings ***
Resource    ../Resources/keywords.robot

*** Variables ***
${HUK24_URL}    https://www.huk24.de
${HUK24_TITLE}    HUK24 Digital. Einfach. Günstiger.
${HUK_URL}    https://www.huk.de
${HUK_TITLE}    HUK COBURG: Versicherungen aus Tradition günstig
${VRK_URL}    https://www.vrk.de
${VRK_TITLE}    VRK - Richtig gut versichert!

*** Test Cases ***
Verify HUK24 Website
    Open Browser And Navigate    ${HUK24_URL}
    Check Website Title         ${HUK24_URL}    ${HUK24_TITLE}
    Close Test Browser

Verify HUK Website
    Open Browser And Navigate    ${HUK_URL}
    Check Website Title         ${HUK_URL}    ${HUK_TITLE}
    Close Test Browser

Verify VRK Website
    Open Browser And Navigate    ${VRK_URL}
    Check Website Title         ${VRK_URL}    ${VRK_TITLE}
    Close Test Browser