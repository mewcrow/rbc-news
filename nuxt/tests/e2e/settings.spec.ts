import { test, expect } from '@playwright/test'
import { waitForHydration } from './../utils/wait-for-hydration'
import { getConsoleTracker, setConsoleTracker, trackConsole } from '../utils/track-console'

test.beforeEach(async ({ page }, testInfo) => {
  setConsoleTracker(testInfo, trackConsole(page))
  await page.goto('/settings')
});


test.describe('settings page', () => {
  test('user can update settings', async ({ page, context }) => {
    await waitForHydration(page);

    await page.getByPlaceholder('Количество').fill('10')
    const settingsCookie = (await context.cookies()).find(c => c.name === 'settings')?.value
    const settings = JSON.parse(decodeURIComponent(settingsCookie || ''))

    expect(settings.newsPerPage).toBe(10)
  })
})


test.afterEach(async ({}, testInfo) => {
  const console = getConsoleTracker(testInfo)
  console?.expectNoErrors();
});