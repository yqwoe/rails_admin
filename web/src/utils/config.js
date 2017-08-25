const APIV1 = '/api/v1'
const apiPrefix = '/v1'
module.exports = {
  name: 'RAILS Admin',
  prefix: 'railsAdmin',
  footerText: 'Ant Design Admin  © 2017 zuiidea',
  logo: '/minsheng_logo.png',
  iconFontCSS: '/iconfont.css',
  iconFontJS: '/iconfont.js',
  CORS: [],
  openPages: ['/login'],
  apiPrefix: '/v1',
  APIV1,
  api: {
    sessions: `${apiPrefix}/sessions`,
    user: `${apiPrefix}/sessions/:id`,
  },
}
