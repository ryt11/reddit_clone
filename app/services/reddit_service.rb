class RedditService

  include RedditApiPaths

  attr_reader :oauth_connection

  def initialize
    @oauth_connection = Faraday.new('https://oauth.reddit.com')
  end

  def user_info(token)
    oauth_request(account_info[:path], token)
  end

  def user_subscriptions(token)
    oauth_request(subscriptions[:path], token)
  end

  private

  def oauth_request(url_path, token)
    response = oauth_connection.get do |req|
      req.url url_path
      req.headers['Authorization'] = "bearer #{token}"
    end
     parse(response.body)
  end

  def parse(response)
    JSON.parse(response, symbolize_names: true)
  end
end
