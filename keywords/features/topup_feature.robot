*** Settings ***
Resource    ${CURDIR}/../../resources/import.robot

*** Keywords ***
Verify topup page components is displayed as expected
    [Arguments]    ${expected_card_id}
    topup_page.Verify pay button is disabled
    topup_page.Verify cancel button is displayed
    topup_page.Verify topup header is displayed
    topup_page.Verify topup card id is match with expect    expected_card_id=${expected_card_id}

Input topup amount verify balance and pay
    [Arguments]    ${topup_amount}    ${current_balance}
    topup_page.Input nokcash amount    amount=${topup_amount}
    topup_page.Verify current balance is match with expected    expected_current_balance=${current_balance}
    topup_page.Verify total amount is match with expected    current_balance=${current_balance}    topup_balance=${topup_amount}
    topup_page.Click at pay button

Select suggestion topup amount verify balance and pay
    [Arguments]    ${topup_amount}    ${current_balance}
    topup_page.Click at nokcash suggest amount    amount=${topup_amount}
    topup_page.Verify current balance is match with expected    expected_current_balance=${current_balance}
    topup_page.Verify total amount is match with expected    current_balance=${current_balance}    topup_balance=${topup_amount}
    topup_page.Click at pay button

Verify transfer components is displayed as expected
    [Arguments]    ${expected_bank_account}    ${expected_bank_account_number}
    topup_page.Verify landing to payment summary page
    topup_page.Verify bank account is displayed    expected_bank_account=${expected_bank_account}
    topup_page.Verify bank account number is displayed    expected_bank_account_number=${expected_bank_account_number}
    topup_page.Verify add slip button is displayed
    topup_page.Verify copy button is displayed
    topup_page.Verify cancel topup button is displayed

Verify payment summary page components is displayed as expected
    [Arguments]    ${expected_nokcash_amount}    ${expected_subtotal}    ${expected_total_price}    ${expected_remaining_amount}
    topup_page.Click at expand payment summary button
    topup_page.Verify topup nokcash amount is displayed    expected_nokcash_amount=${expected_nokcash_amount}
    topup_page.Verify subtotal is displayed    expected_subtotal=${expected_subtotal}
    topup_page.Verify total price is displayed    expected_total_price=${expected_total_price}
    topup_page.Verify remaining amount is displayed    expected_remaining_amount=${expected_remaining_amount}

Cancel order
    topup_page.Click at cancel topup button
    topup_page.Click at confirm cancel topup button