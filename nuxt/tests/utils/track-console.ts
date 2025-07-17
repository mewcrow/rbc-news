import { Page, ConsoleMessage, errors } from '@playwright/test'
import { TestInfo } from '@playwright/test';

const consoleTrackers = new WeakMap<TestInfo, ReturnType<typeof trackConsole>>();
export function trackConsole(page: Page) {
  const messages = { errors: [] as string[] }

  page.on('console', (msg: ConsoleMessage) => {
    if (msg.type() === 'error') {
      messages.errors.push(msg.text())
    }
  });

  return {
    getErrors: () => messages.errors,
    expectNoErrors: () => {
      if (messages.errors.length > 0) {
        throw new Error(`Console errors detected:\n${messages.errors.join('\n')}`)
      }
    }
  }
}

export function setConsoleTracker(testInfo: TestInfo, tracker: ReturnType<typeof trackConsole>) {
  consoleTrackers.set(testInfo, tracker);
}

export function getConsoleTracker(testInfo: TestInfo) {
  return consoleTrackers.get(testInfo);
}