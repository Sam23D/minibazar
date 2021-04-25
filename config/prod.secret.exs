# In this file, we load production configuration and secrets
# from environment variables. You can also hardcode secrets,
# although such is generally not recommended and you have to
# remember to add this file to your .gitignore.
use Mix.Config

database_url =
  System.get_env("DATABASE_URL") ||
    raise """
    environment variable DATABASE_URL is missing.
    For example: ecto://USER:PASS@HOST/DATABASE
    """

config :mini_bazar, MiniBazar.Repo,
  ssl: true,
  url: database_url,
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")

secret_key_base =
  System.get_env("SECRET_KEY_BASE") ||
    raise """
    environment variable SECRET_KEY_BASE is missing.
    You can generate one by calling: mix phx.gen.secret
    """

ssl_key_path = System.get_env("SSL_CERT_PATH") || raise "environment variable SSL_CERT_PATH is missing."
ssl_cert_path = System.get_env("SSL_CERT_PATH") || raise "environment variable SSL_CERT_PATH is missing."
ssl_cacert_path = System.get_env("SSL_CACERT_PATH") || raise "environment variable SSL_CACERT_PATH is missing."

config :mini_bazar, MiniBazarWeb.Endpoint,
  http: [
    port: String.to_integer(System.get_env("PORT") || "4000"),
    transport_options: [socket_opts: [:inet6]]
  ],
  secret_key_base: secret_key_base,
  https: [
    port: 443,
    cipher_suite: :strong,
    otp_app: :mini_bazar,
    keyfile: ssl_key_path,
    certfile: ssl_cert_path,
    # cacertfile: ssl_cacert_path
  ]

# ## Using releases (Elixir v1.9+)
#
# If you are doing OTP releases, you need to instruct Phoenix
# to start each relevant endpoint:
#
#     config :mini_bazar, MiniBazarWeb.Endpoint, server: true
#
# Then you can assemble a release by calling `mix release`.
# See `mix help release` for more information.
