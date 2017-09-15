import { request, config } from 'utils'
import Cookie from '../misc/cookie'
const { api } = config
const { user, sessions } = api

export async function login (params) {
  return request({
    url: sessions,
    method: 'post',
    data: params,
  })
}

export async function logout (params) {

  let user_id = Cookie.get('_rails_admin_id')
  return request({
    url: `${sessions}/${user_id}.json`,
    method: 'delete',
    data: params,
  })
}
export async function query (params) {
  let user_id = Cookie.get('_rails_admin_id')
    return request({
      url: user.replace('/:id', `/${user_id ? user_id : ''}.json`),
      method: 'get'
    })
}
