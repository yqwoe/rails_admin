import { request, config } from 'utils'

const { api } = config
const { user, sessions } = api

export async function login (params) {

  console.log(sessions)
  return request({
    url: sessions,
    method: 'post',
    data: params,
  })
}

export async function logout (params) {

  console.log(sessions)
  return request({
    url: sessions,
    method: 'get',
    data: params,
  })
}

export async function query (params) {
  return request({
    url: user.replace('/:id', `/${params ? params.id : ''}.json`),
    method: 'get'
  })
}
