*** Settings ***
Resource    ${CURDIR}/../../resources/import.robot

*** Keywords ***
Open lotteryplus website
    ${chrome_options}=    BuiltIn.Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    BuiltIn.Call Method    ${chrome_options}    add_argument    --start-maximized
    BuiltIn.Call Method    ${chrome_options}    add_argument    --no-sandbox
    # BuiltIn.Call Method    ${chrome_options}    add_argument    --headless
    BuiltIn.Call Method    ${chrome_options}    add_argument    --window-size\=1920,1080
    BuiltIn.Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    SeleniumLibrary.Open browser    ${URL}    ${BROWSER}    options=${chrome_options}

Click element when ready
    [Documentation]     Keyword to wait for element to be visible before clicking.
    ...     \n default retry clicking is 3 times
    ...     \n can also wait for only page is CONTAINS element instead of visible
    [Arguments]     ${locator}  ${retry}=10    ${only_contains}=${FALSE}       ${timeout}=${ui_setting['GLOBAL_TIMEOUT']}
    FOR     ${i}    IN RANGE    1   ${retry}
        IF  ${only_contains}
            ${wait_status}=             Run keyword and ignore error   SeleniumLibrary.Wait until page contains element     ${locator}    ${timeout}
            ${err_msg_wait}=            Convert to string       ${wait_status[1]}
            ${is_not_stale_wait}=       BuiltIn.Run keyword and return status    Should not contain     ${err_msg_wait}      StaleElementReferenceException
        ELSE
            SeleniumLibrary.Wait until element is enabled    ${locator}     ${timeout}
            ${wait_status}=             Run keyword and ignore error   SeleniumLibrary.Wait until element is visible        ${locator}   ${timeout}
            ${err_msg_wait}=            Convert to string       ${wait_status[1]}
            ${is_not_stale_wait}=       BuiltIn.Run keyword and return status    Should not contain     ${err_msg_wait}      StaleElementReferenceException
        END
        ${is_success}=          Run keyword and ignore error   SeleniumLibrary.Click element   ${locator}
        ${err_msg}=             Convert To String       ${is_success[1]}
        ${is_obsecure}=         BuiltIn.Run keyword and return status    Should not contain     ${err_msg}       Other element would receive the click
        ${is_not_stale}=        BuiltIn.Run keyword and return status    Should not contain     ${err_msg}       StaleElementReferenceException
        ${is_no_err}=           BuiltIn.Run keyword and return status    Should be true        '${err_msg}' == '${NONE}'
        ${is_empty_wait}=       BuiltIn.Run keyword and return status    Should be true         '${err_msg_wait}' == '${NONE}'
        ${result}=              BuiltIn.Evaluate    ${is_success} and ${is_not_stale_wait} and ${is_obsecure} and ${is_not_stale} and ${is_no_err} and ${is_empty_wait}
        BuiltIn.Exit for loop if        ${result}
    END
    Should be true  ${result}   msg="Failed to click element after ${retry} retry"

Replace string and click element when ready
    [Arguments]    ${locator}    &{replacements}
    ${locator}    common.Replace multiple strings    ${locator}    &{replacements}
    webcommon.Click element when ready    ${locator}    timeout=${ui_setting['medium_timeout']}

Wait until element is visible except stale
    [Documentation]  Wait until element is visible except stale
    ...     \n default timeout is same as ${ui_setting['GLOBAL_TIMEOUT']}
    [Arguments]    ${locator}       ${timeout}=${ui_setting['GLOBAL_TIMEOUT']}
    FOR     ${i}    IN RANGE    1       15
        ${status}           Run keyword and ignore error   SeleniumLibrary.Wait until element is visible    ${locator}      ${timeout}
        ${err_msg}=         Convert To String       ${status[1]}
        ${is_not_stale}=    BuiltIn.Run keyword and return status    Should not contain     ${err_msg}      StaleElementReferenceException
        BuiltIn.Exit for loop If        ${is_not_stale}
    END
    SeleniumLibrary.Wait until element is visible    ${locator}      ${timeout}
    BuiltIn.Should Be True  ${is_not_stale}     msg='element is not visible and still in stale stage'

Get text from element when ready
    [Documentation]     Wait until element is visible first before get text from element. 
                        ...     \n default timeout is same as ${ui_setting['GLOBAL_TIMEOUT']}
    [Arguments]     ${locator}      ${timeout}=${ui_setting['GLOBAL_TIMEOUT']}
    SeleniumLibrary.Wait until element is visible    ${locator}     ${timeout}
    ${text}=    SeleniumLibrary.Get text    ${locator}
    RETURN    ${text}

Wait until element is disabled
    [Arguments]    ${locator}    ${timeout}=${ui_setting['GLOBAL_TIMEOUT']}
    webcommon.Wait until element is visible except stale  locator=${locator}    timeout=${timeout}
    SeleniumLibrary.Element should be disabled    ${locator}

Input text to element when ready
    [Documentation]     Keyword to wait for element to be visible before inputting text.
    ...     \n default retry inputting is 10 times
    ...     \n can also wait for only page is CONTAINS element instead of visible
    [Arguments]     ${locator}  ${text}  ${retry}=10  ${only_contains}=${FALSE}  ${timeout}=${ui_setting['medium_timeout']}    ${delay}=${ui_setting['tiny_timeout']}
    FOR     ${i}    IN RANGE    1   ${retry}
        IF  ${only_contains}
            ${wait_status}=             Run keyword and ignore error   SeleniumLibrary.Wait until page contains element     ${locator}    ${timeout}
            ${err_msg_wait}=            Convert to string       ${wait_status[1]}
            ${is_not_stale_wait}=       BuiltIn.Run keyword and return status    Should not contain     ${err_msg_wait}      StaleElementReferenceException
        ELSE
            SeleniumLibrary.Wait until element is enabled    ${locator}     ${timeout}
            ${wait_status}=             Run keyword and ignore error   SeleniumLibrary.Wait until element is visible        ${locator}   ${timeout}
            ${err_msg_wait}=            Convert to string       ${wait_status[1]}
            ${is_not_stale_wait}=       BuiltIn.Run keyword and return status    Should not contain     ${err_msg_wait}      StaleElementReferenceException
        END
        Run keyword and ignore error   SeleniumLibrary.Clear element text   ${locator}
        BuiltIn.Sleep    ${delay}
        ${is_success}=          Run keyword and ignore error   SeleniumLibrary.Input text   ${locator}  ${text}
        ${err_msg}=             Convert To String       ${is_success[1]}
        ${is_obsecure}=         BuiltIn.Run keyword and return status    Should not contain     ${err_msg}       Other element would receive the input
        ${is_not_stale}=        BuiltIn.Run keyword and return status    Should not contain     ${err_msg}       StaleElementReferenceException
        ${is_no_err}=           BuiltIn.Run keyword and return status    Should be true        '${err_msg}' == '${NONE}'
        ${is_empty_wait}=       BuiltIn.Run keyword and return status    Should be true         '${err_msg_wait}' == '${NONE}'
        ${result}=              BuiltIn.Evaluate    ${is_success} and ${is_not_stale_wait} and ${is_obsecure} and ${is_not_stale} and ${is_no_err} and ${is_empty_wait}
        BuiltIn.Exit for loop if        ${result}
    END
    Should be true  ${result}   msg="Failed to input text after ${retry} retry"

Open lotteryplus website and login with line id
    [Documentation]    Already login with line id before
    webcommon.Open lotteryplus website
    homepage_page.Click at sign in / sign up button
    line_login_page.Click at login button
    BuiltIn.Run keyword and ignore error    homepage_page.Click at accept cookie button