const APIV1 = '/api/v1'
const apiPrefix = '/v1'
import Cookie from '../misc/cookie'
module.exports = {
  name: 'rails-admin',
  prefix: 'railsAdmin',
  footerText: 'Ant Design Admin  © 2017 zuiidea',
  logo: '/minsheng_logo.png',
  iconFontCSS: '/iconfont.css',
  iconFontJS: '/iconfont.js',
  CORS: [],
  openPages: ['/sing_in'],
  apiPrefix: '/v1',
  APIV1,
  Cookie,
  api: {
    sessions: `${apiPrefix}/sessions`,
    user: `${apiPrefix}/admin/users/:id`,
    resources: `${apiPrefix}/admin/resources`,
  },
  authorizationToken:()=> {
    return {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + Cookie.get('_rails_admin_session'),
      'Content-Type': 'application/json',
      'Access-Control-Allow-Origin':'*'
    }
  }
}
