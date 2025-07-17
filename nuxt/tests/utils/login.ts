import { request } from '@playwright/test'
import fs from 'fs'

export async function loginViaApi() {
  const requestContext = await request.newContext()

  const csrfResponse = await requestContext.get('http://localhost:8001/sanctum/csrf-cookie')
  if (!csrfResponse.ok()) {
    throw new Error(`CSRF token fetch failed: ${csrfResponse.status()}`)
  }
  const cookies = await requestContext.storageState().then(s => s.cookies)
  const xsrf = cookies.find(c => c.name === 'XSRF-TOKEN')?.value

  const response = await requestContext.post('http://localhost:8001/api/login', {
    data: {
      email: 'admin@local',
      password: 'qwerty123',
    },
    headers: {
      'X-XSRF-TOKEN': decodeURIComponent(xsrf!),
    },
  })

  if (!response.ok()) {
    throw new Error(`Login failed: ${response.status()} ${await response.text()}`)
  }

  const storage = await requestContext.storageState()
  fs.writeFileSync('tests/auth.json', JSON.stringify(storage, null, 2))

  await requestContext.dispose()
}