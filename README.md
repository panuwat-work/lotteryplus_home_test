# LotteryPlus Topup Cash Automation

This project is an automated test suite for the **LotteryPlus** website, specifically focusing on the **Topup Cash** flow. It is built using the **Robot Framework** and follows the **Page Object Model (POM)** architectural pattern for better maintainability and scalability.

## ⚠️ Important Note: Cloudflare Issue
> [!WARNING]
> Currently, this automation script **cannot run on the production environment** because of Cloudflare's bot protection.

---

## Project Structure

The project is organized into several key directories:

- `testcases/`: Contains the `.robot` files defining the test scenarios.
- `keywords/`:
    - `pages/`: Page-specific keywords (POM).
    - `features/`: High-level business logic and workflows.
    - `common/`: Reusable keywords shared across the project.
- `resources/`:
    - `locator/`: Element locators for each page.
    - `testdata/`: External test data (e.g., `.yaml` files).
    - `settings/`: Global configuration (URLs, browser settings, timeouts).
    - `import.robot`: Centralized resource file that imports all libraries and keywords.

---

## Configuration

Project configuration can be found in `resources/settings/ui_setting.yaml`:
- **URL**: Primary website URL.
- **BROWSER**: Target browser for execution (default is Chrome).
- **Timeouts**: Various wait times and retry settings.

---

## Running Tests

To execute the top-up cash test suite, run the following command from the project root:

```bash
robot --dryrun testcases/tc_topup.robot
```

---

## Automated Test Cases

| ID | Description |
| :--- | :--- |
| **TC-TOPUP-01** | Top-up cash success (manual input amount) |
| **TC-TOPUP-05** | Top-up cash using suggested amount |
| **TC-TOPUP-09** | Cancel top-up flow at NokCash page |