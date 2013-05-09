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

require 'spec_helper'

describe Url do
  before(:each) do
    @attr = {
      target_url: 'http://www.thisdomain.com'
    }
  end

  describe 'validation' do
    describe 'success' do
      it 'should succeed when the arguments are valid' do
        Url.create!(@attr)
      end
    end

    describe 'failure' do
      it 'should fail when target_url is invalid' do
        @bad_attr = @attr.merge({
          target_url: 'david'
          })

        Url.new(@bad_attr).should_not be_valid
      end
    end
  end

  describe 'save' do

    it 'should populate the secret token field' do
      Url.create!(@attr).secret_token.should_not be_nil
    end

    it 'should enforce secret token uniqueness' do
      first_url  = Url.create!(@attr)
      second_url = Url.new(@attr)

      second_url.stub(:create_secret_token) { first_url.secret_token }

      second_url.should_not be_valid
    end
  end
end
