*** Settings ***
Resource    ${CURDIR}/../../resources/import.robot

*** Keywords ***
Login with line account
    homepage_page.Click at sign in / sign up button
    line_login_page.Click at login button