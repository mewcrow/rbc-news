import { expect, Page } from '@playwright/test';

/**
 * Мокает запрос и проверяет тело запроса через expect.
 * Возвращает данные запроса, включая путь, тело и метод.
 */
export async function mockRequest(params: {
  page: Page
  path: string | RegExp
  method?: string
  status?: number
  fulfillWith?: object
  expectedBody?: Record<string, any>
}): Promise<Record<string, any>> {
  const result = {
    path: '',
    body: {},
    method: '',
    response: {}
  }

  await params.page.route(params.path, async route => {
    const req = route.request()
    result.path = req.url()
    result.method = req.method()

    if (params.expectedBody) {
      const body = await req.postDataJSON()
      result.body = body
      expect(body).toMatchObject(params.expectedBody)
    }

    if (params.method) {
      expect(route.request().method()).toBe(params.method.toUpperCase())
    }

    if (params.fulfillWith) {
      await route.fulfill({
        status: params.status ?? 200,
        contentType: 'application/json',
        body: JSON.stringify(params.fulfillWith)
      })
      result.response = params.fulfillWith
    }
  })

  return result
}
