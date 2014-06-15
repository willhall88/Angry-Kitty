Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['omniauth_twitter_app_id'], ENV['omniauth_twitter_secret']
end