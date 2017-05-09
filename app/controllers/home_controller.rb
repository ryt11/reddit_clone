class HomeController < ApplicationController
  def index
    RedditService.new.subs(current_user.token)
  end
end
