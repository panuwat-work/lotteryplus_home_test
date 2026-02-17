l*** Settings ***
Resource    ${CURDIR}/../../resources/import.robot

*** Keywords ***
Verify topup header is displayed
    webcommon.Wait until element is visible except stale    locator=${topup_locator['txt_topup_header']}

Verify topup card id is match with expect
    [Arguments]    ${expected_card_id}
    ${actual_card_id}    webcommon.Get text from element when ready    locator=${topup_locator['lbl_card_id']}
    BuiltIn.Should be equal    ${actual_card_id}    ${expected_card_id}

Input nokcash amount
    [Arguments]    ${amount}
    webcommon.Input text to element when ready    locator=${topup_locator['txt_nok_cash_amount']}    text=${amount}

Click at nokcash suggest amount
    [Arguments]    ${amount}
    webcommon.Replace string and click element when ready  locator=${topup_locator['btn_suggestion_amount']}    @#amount@#=${amount}

Verify current balance is match with expected
    [Arguments]    ${expected_current_balance}
    ${actual_current_balance}    webcommon.Get text from element when ready    locator=${topup_locator['lbl_current_balance']}
    BuiltIn.Should be equal    ${actual_current_balance}    ${expected_current_balance}

Verify total amount is match with expected
    [Arguments]    ${current_balance}    ${topup_balance}
    ${expected_total_amount}    BuiltIn.Evaluate    int(${current_balance}) + int(${topup_balance})
    ${actual_total_amount}    webcommon.Get text from element when ready    locator=${topup_locator['lbl_total_amount']}
    BuiltIn.Should be equal    ${actual_total_amount}    ${expected_total_amount}

Verify pay button is disabled
    webcommon.Wait until element is disabled    locator=${topup_locator['btn_pay']}

Click at pay button
    webcommon.Click element when ready    locator=${topup_locator['btn_pay']}

Verify cancel button is displayed
    webcommon.Wait until element is visible except stale    locator=${topup_locator['btn_cancel']}

Click at cancel button
    webcommon.Click element when ready    locator=${topup_locator['btn_cancel']}

Verify landing to payment summary page
    webcommon.Wait until element is visible except stale    locator=${topup_locator['txt_payment_summary']}

Verify payment header is displayed
    webcommon.Wait until element is visible except stale    locator=${topup_locator['txt_payment_header']}

Verify copy button is displayed
    webcommon.Wait until element is visible except stale    locator=${topup_locator['btn_copy']}

Verify add slip button is displayed
    webcommon.Wait until element is visible except stale    locator=${topup_locator['btn_add_slip']}

Verify bank account is displayed
    [Arguments]    ${expected_bank_account}
    ${actual_bank_account}    webcommon.Get text from element when ready    locator=${topup_locator['lbl_bank_account']}
    BuiltIn.Should be equal    ${actual_bank_account}    ${expected_bank_account}

Verify cancel topup button is displayed
    webcommon.Wait until element is visible except stale    locator=${topup_locator['btn_cancel_topup']}

Click at expand payment summary button
    webcommon.Click element when ready    locator=${topup_locator['btn_expand_payment_summary']}

Verify bank account number is displayed
    [Arguments]    ${expected_bank_account_number}
    ${actual_bank_account_number}    webcommon.Get text from element when ready    locator=${topup_locator['lbl_bank_account_number']}
    BuiltIn.Should be equal    ${actual_bank_account_number}    ${expected_bank_account_number}
    
Verify topup nokcash amount is displayed
    [Arguments]    ${expected_nokcash_amount}
    ${actual_nokcash_amount}    webcommon.Get text from element when ready    locator=${topup_locator['lbl_nokcash_amount']}
    BuiltIn.Should be equal    ${actual_nokcash_amount}    ${expected_nokcash_amount}

Verify subtotal is displayed
    [Arguments]    ${expected_subtotal}
    ${actual_subtotal}    webcommon.Get text from element when ready    locator=${topup_locator['lbl_subtotal']}
    BuiltIn.Should be equal    ${actual_subtotal}    ${expected_subtotal}

Verify total price is displayed
    [Arguments]    ${expected_total_price}
    ${actual_total_price}    webcommon.Get text from element when ready    locator=${topup_locator['lbl_total_price']}
    BuiltIn.Should be equal    ${actual_total_price}    ${expected_total_price}

Verify remaining amount is displayed
    [Arguments]    ${expected_remaining_amount}
    ${actual_remaining_amount}    webcommon.Get text from element when ready    locator=${topup_locator['lbl_remaining_amount']}
    BuiltIn.Should be equal    ${actual_remaining_amount}    ${expected_remaining_amount}

Click at cancel topup button
    webcommon.Click element when ready    locator=${topup_locator['btn_cancel_topup']}

Click at confirm cancel topup button
    [Arguments]    ${cancel_wait_delay}=${ui_settings['cancel_wait_delay']}
    SeleniumLibrary.Wait until element is enabled    locator=${topup_locator['btn_confirm_cancel_topup']}    timeout=${cancel_wait_delay}