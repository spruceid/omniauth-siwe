# frozen_string_literal: true

require 'omniauth'
require 'omniauth_openid_connect'
require 'siwe'

module OmniAuth
  module Strategies
    class SIWE < OmniAuth::Strategies::OpenIDConnect
      option :name, 'siwe'
      option :discovery, false

      option :issuer, 'https://oidc.login.xyz/'
      option(:client_options,
             scheme: 'https',
             host: 'oidc.login.xyz',
             port: 443,
             authorization_endpoint: '/authorize',
             token_endpoint: '/token',
             userinfo_endpoint: '/userinfo',
             jwks_uri: '/jwk',
             identifier: '',
             secret: '')

      def redirect_uri
        return callback_url.to_s unless params['redirect_uri']

        "#{callback_url}?redirect_uri=#{CGI.escape(params['redirect_uri'])}"
      end
    end
  end
end

OmniAuth.config.add_camelization('siwe', 'SIWE')
OpenIDConnect.validate_discovery_issuer = false
