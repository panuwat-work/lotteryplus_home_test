*** Variables ***
&{homepage_locator}
...    btn_sign_in_sign_up=xpath=//span[contains(@class,"profile-navbar") and text()="เข้าสู่ระบบ / สมัครสมาชิก"]
...    btn_accept_cookie=xpath=//button[@data-testid="button"]/span[text()="ยอมรับทั้งหมด"]
...    btn_nokcash=xpath=//button[@data-testid="nok-more-nok-cash-icon"]
...    homepage=xpath=//div[@data-testid="home"]