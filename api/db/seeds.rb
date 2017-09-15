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

User.create!(
    name: 'guest',
    mobile: '18939525567',
    password: '123456',
    password_confirmation: '123456',
    username: 'guest'
)


@root=Resource.find_or_create_by!(
      name: '后台管理',
      key: 'admin',
      icon: 'setting',
      menu_id: 0
)
Resource.find_or_create_by!(
    name: '用户管理',
    key: 'users',
    parent_id: @root.id,
    url: '/admin/users',
    icon: 'user',
    menu_id: 1
)

Resource.find_or_create_by!(
    name: '用户登录',
    key: 'sessions',
    parent_id: @root.id,
    url: '/sessions',
    icon: 'loading',
    menu_id: 2
)

Resource.find_or_create_by!(
    name: '角色管理',
    key: 'roles',
    parent_id: @root.id,
    url: '/admin/roles',
    icon: 'user-add',
    menu_id: 1
)

Resource.find_or_create_by!(
    name: '权限管理',
    key: 'resources',
    parent_id: @root.id,
    url: '/admin/resources',
    icon: 'safety',
    menu_id: 1
)
Resource.find_or_create_by!(
    name: '组织管理',
    key: 'groups',
    parent_id: @root.id,
    url: '/admin/groups',
    icon: 'usergroup-add',
    menu_id: 1
)

Resource.find_or_create_by!(
    name: '首页',
    key: 'dashboard',
    url: '/dashboard',
    icon: 'home',
    menu_id: 2
)


Role.find_or_create_by!(
    name: 'super_admin',
    title: '系统管理员'
)
Role.find_or_create_by!(
    name: 'guest',
    title: '游客'
)
