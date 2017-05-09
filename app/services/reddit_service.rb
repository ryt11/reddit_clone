class RedditService

  include RedditApiPaths

  attr_reader :oauth_connection

  def initialize
    @oauth_connection = Faraday.new('https://oauth.reddit.com')
  end

  def user_info(token)
    oauth_request(account_info[:path], account_info[:scope], token)
  end

  def subs(token)
    oauth_request(subscriptions[:path], subscriptions[:scope], token)
  end

  private

  def oauth_request(url_path, scope, token)
    response = oauth_connection.get do |req|
      req.url url_path
      req.headers['Authorization'] = "bearer #{token}"
      req.params['scope'] = scope
    end
    parse(response.body)
  end

  def parse(response)
    JSON.parse(response, symbolize_names: true)
  end
end
