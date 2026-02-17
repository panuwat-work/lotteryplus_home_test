*** Settings ***
Resource    ${CURDIR}/../../resources/import.robot

*** Keywords ***
Click at login button
    webcommon.Click element when ready    locator=${line_login_locator['btn_login']}