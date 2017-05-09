require 'rails_helper'

describe "User can see their basic info" do
  it "shows username and karma when clicking on username from root" do
    visit root_path
  end

end
