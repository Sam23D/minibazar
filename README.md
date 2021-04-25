# MiniBazar

To start your Development server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

### Production Release
To make a release
```
POOL_SIZE=4 MIX_ENV=prod mix release
```
To start the server
```
_build/prod/rel/mini_bazar/bin/mini_bazar start
_build/prod/rel/mini_bazar/bin/mini_bazar daemon
```
To top the server
```
_build/prod/rel/mini_bazar/bin/mini_bazar stop
```


## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

