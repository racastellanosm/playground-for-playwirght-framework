import { test, expect } from '@playwright/test';

test.describe(' EquationLabs Simple Test', () => {
    test('should navigate to EquationLabs and validate content on HomePage', async ({ page }) => {
        // Navigate to EquationLabs
        await page.goto('https://equationlabs.io/');

        // Validate the page title
        await expect(page).toHaveTitle("EquationLabs I/O - Lets build your startup idea together");

        // Validate Company Slogan on HomePage
        await expect(page.getByText("Software engineering power to partnership with your startup idea!")).toBeVisible();

        // validate foort content email
        await expect(page.getByText("Drop me a line => hola(@)equationlabs.io")).toBeVisible();
    });
});