*** Settings ***
Library    Browser
Library    Collections

*** Variables ***
${AXE_VIOLATIONS_THRESHOLD}    0
${AXE_CDN_URL}    https://cdnjs.cloudflare.com/ajax/libs/axe-core/4.7.2/axe.min.js

*** Keywords ***
Initialize Axe Core
    ${axe_script}=    Get Page Source    ${AXE_CDN_URL}
    Evaluate JavaScript    ${axe_script}
Run Accessibility Test
    [Arguments]    ${page_name}=Current Page
    Initialize Axe Core
    ${results}=    Evaluate JavaScript    async () => {
    ...    const results = await axe.run();
    ...    return results;
    ...    }
    Log    Accessibility Results for ${page_name}:    console=True
    Log    ${results}    console=True
    ${violations_count}=    Get Length    ${results}[violations]
    Should Be Equal As Numbers    ${violations_count}    ${AXE_VIOLATIONS_THRESHOLD}
    ...    msg=Found ${violations_count} accessibility violations. Check the log for details.

Run Accessibility Test With Custom Rules
    [Arguments]    ${page_name}=Current Page    @{rules}
    Initialize Axe Core
    ${options}=    Create Dictionary    runOnly    @{rules}
    ${results}=    Evaluate JavaScript    async (options) => {
    ...    const results = await axe.run(document, options);
    ...    return results;
    ...    }    ${options}
    Log    Accessibility Results for ${page_name} (Custom Rules):    console=True
    Log    ${results}    console=True
    ${violations_count}=    Get Length    ${results}[violations]
    Should Be Equal As Numbers    ${violations_count}    ${AXE_VIOLATIONS_THRESHOLD}
    ...    msg=Found ${violations_count} accessibility violations. Check the log for details.

Get Accessibility Violations Summary
    Initialize Axe Core
    ${results}=    Evaluate JavaScript    async () => {
    ...    const results = await axe.run();
    ...    return results;
    ...    }
    ${violations}=    Set Variable    ${results}[violations]
    FOR    ${violation}    IN    @{violations}
        Log    Rule: ${violation}[id] - Impact: ${violation}[impact]    console=True
        Log    Description: ${violation}[description]    console=True
        Log    Help: ${violation}[help]    console=True
        Log    Elements affected: ${violation}[nodes]    console=True
        Log    ---    console=True
    END
    [Return]    ${violations}

Wait For Accessibility Scan
    [Arguments]    ${timeout}=10s
    Initialize Axe Core
    Wait For Function    async () => {
    ...    try {
    ...        await axe.run();
    ...        return true;
    ...    } catch (e) {
    ...        return false;
    ...    }
    ...    }    timeout=${timeout}
