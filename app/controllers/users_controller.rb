class UsersController < ApplicationController
  def show
  @account = Account.new(Account.service.user_info(current_user.token))
  end
end
