# == Schema Information
#
# Table name: users
#
#  id                  :integer(4)      not null, primary key
#  persistence_token   :string(255)     not null
#  single_access_token :string(255)     not null
#  perishable_token    :string(255)     not null
#  login_count         :integer(4)      default(0), not null
#  failed_login_count  :integer(4)      default(0), not null
#  last_request_at     :datetime
#  current_login_at    :datetime
#  last_login_at       :datetime
#  current_login_ip    :string(255)
#  last_login_ip       :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  oauth_token         :string(255)
#  oauth_secret        :string(255)
#  name                :string(255)
#  twitter_uid         :string(255)
#  avatar_url          :string(255)
#  nickname            :string(255)
#  purpose             :text
#  twitter_status      :boolean(1)
#

class User < ActiveRecord::Base

  acts_as_authentic

  before_validation_on_create :populate_oauth_user
  
  validates_presence_of :name, :nickname, :twitter_uid
  
  def twitter_url
    "http://twitter.com/#{nickname}"
  end
  
  def twitter_contact_url
    status = "@#{self.nickname} "
    "http://twitter.com?status=#{CGI::escape(status)}"
  end
  
  def access_token
    OAuth::AccessToken.new(UserSession.oauth_consumer, self.oauth_token, self.oauth_secret)
  end
  
  is_taggable :tags
  
  def tags_array=(tags)
    self.tag_list = tags.join(',')
  end
  
  def self.find_by_tag_id(tag_id)
    User.find(:all, :conditions => {:tags => {:id => tag_id}}, :joins => :tags)
  end
  
  def complete?
    !self.purpose.blank? && !self.tag_list.blank?
  end
  
  def to_param
    self.nickname
  end
  
  private

  def populate_oauth_user
    unless oauth_token.blank?
      @response = UserSession.oauth_consumer.request(:get, '/account/verify_credentials.json',
      access_token, { :scheme => :query_string })
      case @response
      when Net::HTTPSuccess
        user_info = JSON.parse(@response.body)

        self.name        = user_info['name']
        self.nickname    = user_info['screen_name']
        self.twitter_uid = user_info['id']
        self.avatar_url  = user_info['profile_image_url']
      end
    end
  end

end
