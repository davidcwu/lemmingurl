# == Schema Information
#
# Table name: urls
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  target_url   :string(255)      not null
#  secret_token :string(255)      not null
#

require 'base64'

class Url < ActiveRecord::Base
  attr_accessible :target_url, :secret_token

  validates :secret_token, :presence => true,
                           :uniqueness => true

  validates :target_url, :presence => true,
                         :url => true

  before_validation :create_secret_token

  def to_param
    secret_token
  end

  # def to_s
    # 'blah'
    # secret_url(secret_token)
  # end

  private
    def create_secret_token
      random_token = rand(1000)
      self.secret_token = Base64.urlsafe_encode64(random_token.to_s)
    end
end
