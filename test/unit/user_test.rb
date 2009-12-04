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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
