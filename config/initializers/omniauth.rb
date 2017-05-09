Rails.application.config.middleware.use OmniAuth::Builder do
  provider :reddit, ENV['reddit_client_id'], ENV['reddit_client_secret'], scope: 'identity'
end
