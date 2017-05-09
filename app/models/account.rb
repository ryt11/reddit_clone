class Account

  attr_reader :account_info

  def initialize(account_info)
    @account_info = account_info
  end

  def self.service
    @service ||= RedditService.new
  end

  def name
    @account_info[:name]
  end

  def comment_karma
    @account_info[:comment_karma]
  end

  def link_karma
    @account_info[:link_karma]
  end


end
