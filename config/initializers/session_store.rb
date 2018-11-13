# Be sure to restart your server when you modify this file.

Rails.application.config.session_store :cookie_store, key: '_msd_api_session'

# domain = (Rails.env == 'test' ? :all : Ideation::Settings[:host])

# Rails.application.config.session_store ActionDispatch::Session::CacheStore,
#  expire_after: Ideation::Settings[:authentication][:session_expiration_time].seconds,
#   key: '_ideation_session', domain: domain, secure: Rails.env.production?