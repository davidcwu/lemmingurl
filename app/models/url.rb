# == Schema Information
#
# Table name: urls
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  url   :string(255)      not null
#  secret_token :string(255)      not null
#

require 'base64'

class Url < ActiveRecord::Base
  attr_accessible :url

  validates :secret_token, :presence => true,
                           :uniqueness => true

  validates :url, :url => { :message => " is invalid" }

  before_validation :create_secret_token

  def to_param
    secret_token
  end

  private
    # TODO: If there is a conflict, recreate the token
    def create_secret_token
      time = Time.now
      salt = rand(2048)
      random_string = "#{url}#{time}#{salt}"
      random_token = Digest::SHA256.hexdigest(random_string)
      secret_token = Base64.urlsafe_encode64(random_token.to_s)

      self.secret_token = secret_token
    end
end
