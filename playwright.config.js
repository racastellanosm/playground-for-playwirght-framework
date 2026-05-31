const { defineConfig, devices } = require('@playwright/test');

module.exports = defineConfig({
    testDir: './tests',
    fullyParallel: true,
    forbidOnly: !!process.env.CI,
    retries: 1,
    workers: 2,
    outputFolder: 'test-results',
    /* HTML Reporter is configured to output into the 'reports' directory.
       'open: "never"' prevents Playwright from trying to open a browser window inside the headless Docker container. */
    reporter: [
        ['list'],
        ['html', { open: 'never', outputFolder: 'reports' }]
    ],
    use: {
        trace: 'on-first-retry',
        screenshot: 'only-on-failure',
        video: 'retain-on-failure',
        headless: true,
    },
    projects: [
        {
            name: 'chromium',
            use: { ...devices['Desktop Chrome'] },
        },
        {
            name: 'firefox',
            use: { ...devices['Desktop Firefox'] },
        },
        {
            name: 'webkit',
            use: { ...devices['Desktop Safari'] },
        }
    ],
});