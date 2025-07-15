import {
  // test,
  expect,
  // type Page
} from '@playwright/test';
import { test } from '@nuxt/test-utils/playwright'
import { registerEndpoint } from '@nuxt/test-utils/runtime'

registerEndpoint('/api/user', () => ({
      "id": 1,
      "name": "Admin",
      "email": "admin@local",
      "role": "admin"
    }))

test.beforeEach(async ({ page }) => {
  await page.goto('/');
  // await page.waitForFunction(() => window.isHydrated === true);
});

test.describe('Index page', () => {
  test('login button is present', async ({ page }) => {
    await page.route('*/**/api/user', async route => {
    const json = {
      "id": 1,
      "name": "Admin",
      "email": "admin@local",
      "role": "admin"
    };
    await route.fulfill({ json });
  });

    expect(page.locator('.top-bar')).toContainText('Войти')
  });
})