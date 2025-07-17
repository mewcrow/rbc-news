import { test, expect } from '@playwright/test'
import { getConsoleTracker, setConsoleTracker, trackConsole } from '../utils/track-console'
import { waitForHydration } from '../utils/wait-for-hydration'
import { mockRequest } from '../utils/mock-request'

test.beforeEach(async ({ page }, testInfo) => {
  setConsoleTracker(testInfo, trackConsole(page))
});


test.describe('authentication', () => {
  test('user can log in', async ({ page }, testInfo) => {
    await mockRequest({
      page,
      path: '**/api/login**',
      method: 'POST',
      expectedBody: { email: 'admin@local', password: 'qwerty123' },
    })

    await page.goto('/auth/login')
    await waitForHydration(page)

    await page.fill('input[name="email"]', 'admin@local')
    await page.fill('input[name="password"]', 'qwerty123')
    await page.click('button[type="submit"]')

    const console = getConsoleTracker(testInfo)
    console?.expectNoErrors();
  })

  test('user can register', async ({ page }, testInfo) => {
    await mockRequest({
      page,
      path: '**/api/register**',
      method: 'POST',
      expectedBody: {
        email: 'admin@local',
        name: 'Admin',
        password: 'qwerty123',
        password_confirmation: 'qwerty123',
      },
      fulfillWith: { result: 'Success' },
    })

    await page.goto('/auth/register')
    await waitForHydration(page)

    await page.fill('input[name="name"]', 'Admin')
    await page.fill('input[name="email"]', 'admin@local')
    await page.fill('input[name="password"]', 'qwerty123')
    await page.fill('input[name="password_confirmation"]', 'qwerty123')
    await page.click('button[type="submit"]')

    const console = getConsoleTracker(testInfo)
    console?.expectNoErrors();
  })

  test('user sees validation errors', async ({ page }, testInfo) => {
    await mockRequest({
      page,
      path: '**/api/login**',
      method: 'POST',
      status: 422,
      fulfillWith: {
        errors: { email: ["Неверное имя пользователя или пароль."] }
      },
    })

    await page.goto('/auth/login')
    await waitForHydration(page)

    await page.fill('input[name="email"]', 'admin@local')
    await page.fill('input[name="password"]', 'qwerty123')
    await page.click('button[type="submit"]')

    await expect(page.locator('body')).toContainText('Неверное имя пользователя или пароль')

    const console = getConsoleTracker(testInfo)
    await expect(console?.getErrors()).toHaveLength(1)
  })
})