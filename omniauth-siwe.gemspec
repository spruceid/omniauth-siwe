# frozen_string_literal: true

require_relative 'lib/omniauth-siwe/version'

Gem::Specification.new do |spec|
  spec.add_runtime_dependency 'bcrypt'
  spec.add_runtime_dependency 'omniauth'
  spec.add_runtime_dependency 'omniauth_openid_connect'
  spec.add_runtime_dependency 'siwe'

  spec.required_ruby_version = '>= 2.6.0'
  spec.name = 'omniauth-siwe'
  spec.description = 'OmniAuth strategy for Sign In With Ethereum (SIWE)'
  spec.summary = spec.description
  spec.homepage = 'https://github.com/spruceid/omniauth-siwe'
  spec.version = Omniauth::Siwe::VERSION
  spec.authors = ['Spruce Systems, Inc.']
  spec.licenses = ['MIT', 'Apache-2.0']
  spec.files = Dir['lib/**/*', 'LICENSE-MIT', 'LICENSE-APACHE', 'README.md']
  spec.bindir = 'exe'
  spec.require_paths = ['lib']
end
