# Blatant

### Gigalixir

https://console.gigalixir.com/#/

Follow this:
https://gigalixir.readthedocs.io/en/latest/getting-started-guide.html#install-the-command-line-interface

Alias `gigalixir` to `g`.
Note the gigalixir app was created using this command (AFTER populating the `elixir_buildpack.config` file):
```
g login
g create -n blatant -c gcp -r europe-west1 
g pg:create --free
git push gigalixir master
g run mix ecto.migrate

```
see app details with `g app`, db details with `g pg` and status with `g ps`.

### default readme:

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Reset DB with `mix ecto.reset`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
