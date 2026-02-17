*** Settings ***
Resource    ${CURDIR}/../../resources/import.robot

*** Keywords ***
Click at sign in / sign up button
    webcommon.Click element when ready    locator=${homepage_locator['btn_sign_in_sign_up']}

Click at accept cookie button
    webcommon.Click element when ready    locator=${homepage_locator['btn_accept_cookie']}

Click at nokcash button
    webcommon.Click element when ready    locator=${homepage_locator['btn_nokcash']}

Verify landing to topup page
    webcommon.Wait until element is visible except stale    locator=${homepage_locator['homepage']}