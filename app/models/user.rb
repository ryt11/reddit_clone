class User < ApplicationRecord

  def self.from_omniauth(auth_info)
    user = where(uid: auth_info[:uid]).first_or_initialize do |new_user|
      new_user.uid                = auth_info.uid
      new_user.name               = auth_info.info.name
      new_user.token        = auth_info.credentials.token
    end
    update_token(user, auth_info)
    user
  end

  def self.update_token(user, auth_info)
    user.update_attribute(:token, auth_info[:credentials][:token]) unless user.new_record?
    user.save
  end
end
