import { request, config } from 'utils'

const { api } = config
const { resources } = api

export async function query (params) {
  return request({
    url: resources,
    method: 'get',
    data: params,
  })
}
