require 'rails_helper'
require_relative '../../app/services/reddit_service'

describe RedditService do
  attr_reader :service

  before(:each) do
    @service = RedditService.new
  end

  describe '#user_info' do
    it 'retrieves user info' do
      visit root_path
      user = User.create(uid: "4v25k", name: "CropDuster_", token: "l1s5AY97CTcBeYDpX4QZfN1c19o")
      page.set_rack_session(user_id: user.id)
      user_info = @service.user_info(user.token)
      binding.pry

      expect(legislators.count).to eq(20)
      expect(legislator[:first_name]).to eq('Liz')
      expect(legislator[:last_name]).to eq('Cheney')
    end
  end
end
