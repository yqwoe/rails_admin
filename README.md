#权限管理模板项目

* 路由约定 
```
后端路由: 
       GET /api/v1/users
       POST /api/v1/users
       GET /api/v1/users/new
       GET /api/v1/users/1
       PUT /api/v1/users/1
       PATCH /api/v1/users/1
       DELETE /api/v1/users/1
前端路由: 
        /users
        /users/1
        /users/new
以上约定便于资源权限管理
```