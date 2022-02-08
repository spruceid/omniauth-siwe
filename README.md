# Omniauth::Siwe

OmniAuth strategy for Sign In With Ethereum (SIWE)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-siwe'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install omniauth-siwe

## Usage

To use either [`oidc.login.xyz`](https://oidc.login.xyz) or a self-hosted
alternative, you must first register as a client using the request below
as an example, filling in your application's own redirection URIs.

```bash
$ curl -X POST 'https://oidc.login.xyz/register' \
  -H 'Content-type: application/json' \
  --data '{"redirect_uris": ["http://localhost:3000/auth/siwe/callback"]}'

{"client_id":"your-identifier","client_secret":"your-secret","redirect_uris":["http://localhost:3000/auth/siwe/callback"]}%
```

Then you have to configure the OmniAuth provider like the example below:
If you are using [`oidc.login.xyz`](https://oidc.login.xyz), then you
only need to fill in your credentials, otherwise you will need to change
host, port and scheme according to the chosen host.

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  configure do |config|
    config.path_prefix = '/auth'
    config.allowed_request_methods = %i[post get]
  end

  # other providers

  issuer = 'https://oidc.login.xyz/'
  client_options = {
    scheme: 'https',
    host: 'oidc.login.xyz',
    port: 443,
    authorization_endpoint: '/authorize',
    token_endpoint: '/token',
    userinfo_endpoint: '/userinfo',
    jwks_uri: '/jwk',
    identifier: 'your-identifier',
    secret: 'your-secret'
  }

  provider :siwe, issuer: issuer, client_options: client_options
end
```
