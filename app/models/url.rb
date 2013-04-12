# == Schema Information
#
# Table name: urls
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  shortened_url :string(255)
#  target_url    :string(255)
#

class Url < ActiveRecord::Base
  attr_accessible :shortened_url, :target_url

  validates :shortened_url, :uniqueness => true,
                            :url => true

  validates :target_url, :url => true


end
