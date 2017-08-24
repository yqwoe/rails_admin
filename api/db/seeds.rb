# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(
        name: 'admin',
        mobile: '18939525567',
        password: '123456',
        password_confirmation: '123456',
        username: 'admin'
)

@root=Resource.find_or_create_by!(
      name: '后台管理',
      key: 'admin',
      icon: 'setting'
)

Resource.find_or_create_by!(
    name: '用户管理',
    key: 'users',
    parent_id: @root.id,
    api_url: '/v1/admin/users',
    web_url: '/admin/users',
    icon: 'user'
)
Resource.find_or_create_by!(
    name: '用户登录',
    key: 'sessions',
    parent_id: @root.id,
    api_url: '/v1/sessions',
    web_url: '/sessions',
    icon: 'loading'
)

Resource.find_or_create_by!(
    name: '角色管理',
    key: 'roles',
    parent_id: @root.id,
    api_url: '/v1/admin/roles',
    web_url: '/admin/roles',
    icon: 'user-add'
)
Resource.find_or_create_by!(
    name: '权限管理',
    key: 'resources',
    parent_id: @root.id,
    api_url: '/v1/admin/resources',
    web_url: '/admin/resources',
    icon: 'safety'
)
Resource.find_or_create_by!(
    name: '组织管理',
    key: 'groups',
    parent_id: @root.id,
    api_url: '/v1/admin/groups',
    web_url: '/admin/groups',
    icon: 'usergroup-add'
)
