import { request, config } from 'utils'

const { api } = config
const { sessions } = api

export async function login (data) {
  return request({
    url: sessions,
    method: 'post',
    data,
  })
}
