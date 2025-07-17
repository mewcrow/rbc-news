import { Page } from '@playwright/test'

export async function waitForHydration(page: Page) {
  await page.waitForFunction(() => document.body.classList.contains('hydrated'))
}