*** Settings ***
Resource     ${CURDIR}/../resources/import.robot
Suite Setup    webcommon.Open lotteryplus website and login with line id
Suite Teardown    SeleniumLibrary.Close all browsers

*** Test Cases ***
TC-TOPUP-01
    [Documentation]    Top-up cash success
    [Tags]    tc_001    topup
    homepage_page.Click at nokcash button
    topup_feature.Verify topup page components is displayed as expected    expected_card_id=${tc_001['card_id']}
    topup_feature.Input topup amount verify balance and pay    topup_amount=${tc_001['topup_amount']}    current_balance=${tc_001['current_balance']}
    topup_feature.Verify transfer components is displayed as expected    expected_bank_account=${tc_001['bank_account']}    expected_bank_account_number=${tc_001['bank_account_number']}
    topup_feature.Verify payment summary page components is displayed as expected    expected_nokcash_amount=${tc_001['topup_amount']}    expected_subtotal=${tc_001['topup_amount']}    expected_total_price=${tc_001['topup_amount']}    expected_remaining_amount=${tc_001['remaining_amount']}
    
TC-TOPUP-05
    [Documentation]    เลือกจำนวนเงินจากจำนวนเงินแนะนำ และ กดชำระเงิน
    [Tags]    tc_005    topup
    homepage_page.Click at nokcash button
    topup_feature.Verify topup page components is displayed as expected    expected_card_id=${tc_005['card_id']}
    topup_feature.Select suggestion topup amount verify balance and pay    topup_amount=${tc_005['topup_amount']}    current_balance=${tc_005['current_balance']}
    topup_feature.Verify transfer components is displayed as expected    expected_bank_account=${tc_005['bank_account']}    expected_bank_account_number=${tc_005['bank_account_number']}
    topup_feature.Verify payment summary page components is displayed as expected    expected_nokcash_amount=${tc_005['topup_amount']}    expected_subtotal=${tc_005['topup_amount']}    expected_total_price=${tc_001['topup_amount']}    expected_remaining_amount=${tc_001['remaining_amount']}
    
TC-TOPUP-09
    [Documentation]    Cancel at NokCash page
    [Tags]    tc_009    topup
    homepage_page.Click at nokcash button
    topup_feature.Verify topup page components is displayed as expected    expected_card_id=${tc_009['card_id']}
    topup_page.Click at cancel button
    homepage_page.Verify landing to topup page