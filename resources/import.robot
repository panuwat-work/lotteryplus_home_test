*** Settings ***
Library       SeleniumLibrary
Library       DebugLibrary
Library       String

### common ###
Resource    ${CURDIR}/../keywords/common/common.robot
Resource    ${CURDIR}/../keywords/common/webcommon.robot

### pages ###
Resource    ${CURDIR}/../keywords/pages/homepage_page.robot
Resource    ${CURDIR}/../keywords/pages/topup_page.robot
Resource    ${CURDIR}/../keywords/pages/line_login_page.robot

### features ###
Resource    ${CURDIR}/../keywords/features/topup_feature.robot
Resource    ${CURDIR}/../keywords/features/homepage_feature.robot

### locator ###
Resource    ${CURDIR}/../resources/locator/homepage_locator.robot
Resource    ${CURDIR}/../resources/locator/topup_locator.robot
Resource    ${CURDIR}/../resources/locator/line_login_locator.robot

### testdata ###
Variables    ${CURDIR}/../resources/testdata/tc_topup.yaml

### setting ###
Variables    ${CURDIR}/../resources/settings/ui_setting.yaml