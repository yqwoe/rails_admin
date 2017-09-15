#权限管理模板项目

* 路由约定 
```
后端路由: 
       GET /api/v1/users
       POST /api/v1/users
       GET /api/v1/users/new
       GET /api/v1/users/:id(:format)
       PUT /api/v1/users/:id
       PATCH /api/v1/users/:id
       DELETE /api/v1/users/:id(:format)
前端路由: 
        /users
        /users/:id
        /users/:id/edit
        /users/new
以上约定便于资源权限管理
```

*Ruby GC 配置
```bash
~/.zshrc ^ ~/.bashrc
(可选)export RUBY_HEAP_MIN_SLOTS=1250000
export RUBY_HEAP_SLOTS_INCREMENT=100000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=30000000
export RUBY_HEAP_FREE_MIN=12500
https://gist.github.com/mrcasals/8957351
以上做法是兼容更老版本ruby
```