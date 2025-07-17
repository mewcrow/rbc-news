import { test, expect } from '@playwright/test'
import { getConsoleTracker, setConsoleTracker, trackConsole } from '../utils/track-console'
import { waitForHydration } from '../utils/wait-for-hydration'
import { mockRequest } from '../utils/mock-request'

test.beforeEach(async ({ page }, testInfo) => {
  setConsoleTracker(testInfo, trackConsole(page))
  await page.goto('/')
});


test.describe('index page', () => {
  test('side menu is showing', async ({ page }) => {
    await page.getByText('Меню').click()

    await expect(page.locator('ul.menu')).toBeVisible()
  })

  test('infinite scroll is working', async ({ page }) => {
    await waitForHydration(page)

    const request = await mockRequest({
      page,
      path: '**/api/news**',
      method: 'GET',
    })

    await page.evaluate(() => window.scrollTo(0, document.body.scrollHeight))
    await page.waitForTimeout(250)

    await expect(request.path).toMatch(/page=2/)
    await expect(page.locator('.infinite-scroll .loading')).toBeVisible()
  })
})


test.afterEach(async ({}, testInfo) => {
  const console = getConsoleTracker(testInfo)
  console?.expectNoErrors();
});