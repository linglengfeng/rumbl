# Rumbl

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix

所有请求执行的顺序。请求进入端点，请求进入路由器层，该层请求通过一系列管道后，进入对应的控制器。
connection
|> endpoint
|> router
|> pipelines
|> controller

控制器也是一个功能管道，
connection
|> controller
|> common_services
|> action
通常，行为会访问数据库并渲染视图
connection
|> find_user
|> view
|> template

多个模块之间共享plug，plug规范：必须有init和call，例如：
defmodule NothingPlug do
  def init(opts) do
    opts
  end

  def call(conn, _opts) do
    conn
  end
end
