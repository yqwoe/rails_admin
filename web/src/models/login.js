import { routerRedux } from 'dva/router'
import { queryURL } from 'utils'
import { login } from 'services/login'

import Cookie from '../misc/cookie'
const isLogin=()=>{
  return Cookie.get('user_session')
}
export default {
  namespace: 'login',
  state: {
    loginLoading: false,
    login: !!isLogin()
  },

  effects: {
    * login ({
      payload,
    }, { put, call }) {
      yield put({ type: 'showLoginLoading' })
      const data = yield call(login, payload)
      yield put({ type: 'hideLoginLoading' })
      if (data.success) {
        Cookie.set('_rails_admin_session',data.user.authentication_token)
        Cookie.set('_rails_admin_id',data.user.id)
        const from = queryURL('from')
        yield put({ type: 'app/query' ,payload:{
          id: data.user.id
        }})
        if (from) {
          yield put(routerRedux.push(from))
        } else {
          yield put(routerRedux.push('/dashboard'))
        }
      } else {
        throw data
      }
    },
  },
  reducers: {
    showLoginLoading (state) {
      return {
        ...state,
        loginLoading: true,
      }
    },
    hideLoginLoading (state) {
      return {
        ...state,
        loginLoading: false,
      }
    },
  },
}
