*** Settings ***
Resource          ../Resources/common.robot
Documentation     Example test suite demonstrating accessibility testing with Browser library

Test Setup        New Browser    chromium    headless=False
Test Teardown     Close Browser

*** Test Cases ***
Basic Accessibility Test
    [Documentation]    Performs a basic accessibility test on a webpage
    New Page    https://example.com
    Wait For Load State    networkidle
    Run Accessibility Test    Example Homepage

Test Specific Accessibility Rules
    [Documentation]    Tests specific accessibility rules on a webpage
    New Page    https://example.com
    Wait For Load State    networkidle
    
    @{rules}=    Create List
    ...    color-contrast    # Tests for sufficient color contrast
    ...    html-has-lang    # Ensures HTML element has a lang attribute
    ...    document-title    # Checks if document has a title
    ...    aria-roles       # Validates ARIA roles
    
    Run Accessibility Test With Custom Rules    Example Homepage    @{rules}

Generate Detailed Accessibility Report
    [Documentation]    Generates a detailed accessibility report with violations
    New Page    https://example.com
    Wait For Load State    networkidle
    Wait For Accessibility Scan    timeout=20s
    
    ${violations}=    Get Accessibility Violations Summary
    
    # Example of custom violation processing
    FOR    ${violation}    IN    @{violations}
        Log    Impact Level: ${violation}[impact]    console=yes
        Log    Description: ${violation}[description]    console=yes
        
        # Log affected elements
        FOR    ${node}    IN    @{violation}[nodes]
            Log    Target: ${node}[target]    console=yes
            Log    HTML: ${node}[html]    console=yes
        END
    END

Test Dynamic Content Accessibility
    [Documentation]    Tests accessibility after dynamic content changes
    New Page    https://example.com
    Wait For Load State    networkidle
    
    # Example: Click a button that loads dynamic content
    Click    button#load-more    # Adjust selector as needed
    Wait For Load State    networkidle
    
    # Run accessibility test on updated content
    Run Accessibility Test    Dynamic Content Page
