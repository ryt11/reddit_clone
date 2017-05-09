module RedditApiPaths
  def account_info
    { path: 'api/v1/me', scope: 'identity' }
  end

  def subscriptions
    { path: '/subreddits/mine/subscriber', scope: 'mysubreddits'}
  end
end
