*** Settings ***
Resource    ${CURDIR}/../../resources/import.robot

*** Keywords ***
Replace multiple strings
    [Arguments]    ${locator}    &{replacements}
    FOR    ${key}    ${value}    IN    &{replacements}
        ${value}    BuiltIn.Convert to string    ${value}
        ${locator}    String.Replace string    ${locator}    ${key}    ${value}
    END
    RETURN    ${locator}