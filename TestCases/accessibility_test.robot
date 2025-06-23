*** Settings ***
Resource          ../Resources/common.robot
Test Setup        Open Browser    about:blank    chrome
Test Teardown     Close All Browsers

*** Test Cases ***
Check Page Accessibility
    [Documentation]    Validates the accessibility of a web page using AxeCore
    Go To    https://example.com
    Run Accessibility Test    Example Page
    
Check Specific Accessibility Rules
    [Documentation]    Tests specific accessibility rules
    Go To    https://example.com
    @{rules}=    Create List    color-contrast    html-has-lang    document-title
    Run Accessibility Test With Custom Rules    Example Page    @{rules}
    
Generate Accessibility Report
    [Documentation]    Generates a detailed accessibility violations report
    Go To    https://example.com
    ${violations}=    Get Accessibility Violations Summary
    Log    Found ${violations.__len__()} accessibility violations    console=True
