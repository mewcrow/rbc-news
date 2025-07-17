import { test, expect } from '@playwright/test'
import { waitForHydration } from '../utils/wait-for-hydration'
import { mockRequest } from '../utils/mock-request'
import { getConsoleTracker, setConsoleTracker, trackConsole } from '../utils/track-console'

test.beforeEach(async ({ page }, testInfo) => {
  setConsoleTracker(testInfo, trackConsole(page))
  await page.goto('/')
});


test.describe('news page', () => {
  test.use({ storageState: 'tests/auth.json' })

  test('news are displayed', async ({ page }) => {
    const newsCount = await page.locator('.news').count()

    await expect(newsCount).toBeGreaterThan(0)
  })

  test('user can view full news', async ({ page }) => {
    await waitForHydration(page);

    await page.locator('.news').first().click()

    await expect(page).toHaveURL(/news\/.+/)
  })

  test('admin can update news rating', async ({ page }) => {
    await waitForHydration(page);

    const request = await mockRequest({
      page,
      path: '**/api/news/**',
      method: 'PATCH',
      fulfillWith: { id: 25, rating: 5 },
      expectedBody: { rating: expect.any(Number) }
    })

    const news = await page.locator('.news', { hasText: /Рейтинг:\s*[2-9]/ }).first()
    await news.hover()
    const minusBtn = news.locator('.news-rating > div:nth-child(1)')
    await expect(minusBtn).toBeVisible()
    await minusBtn.click()
    await expect(request.method).toBe('PATCH')
  })

  test('admin can soft delete news', async ({ page }) => {
    await waitForHydration(page);

    const request = await mockRequest({
      page,
      path: '**/api/news/**',
      method: 'DELETE',
      fulfillWith: { success: true },
    })

    const news = await page.locator('.news').first()
    await news.hover()
    const deleteButton = news.locator('.news-rating > div:nth-child(4)')
    await expect(deleteButton).toBeVisible()
    await deleteButton.click()
    await expect(request.method).toBe('DELETE')
  })
})


test.afterEach(async ({}, testInfo) => {
  const console = getConsoleTracker(testInfo)
  console?.expectNoErrors();
});