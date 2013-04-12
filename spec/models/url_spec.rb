# == Schema Information
#
# Table name: urls
#
#  id            :integer          not null, primary key
#  created_at    :datetime
#  updated_at    :datetime
#  shortened_url :string(255)
#  target_url    :string(255)
#

require 'spec_helper'

describe Url do
  before(:each) do
    @attr = {
      shortened_url: 'http://www.thisdomain.com',
      target_url: 'http://www.google.com'
    }
  end

  describe 'validation' do
    describe 'success' do
      it 'should succeed when the URLs are different' do
        Url.create!(@attr)
      end
    end

    describe 'failure' do

      it 'should fail when the shortened URL is not prefixed by this domain name'

      it 'should fail when shortened_url is invalid' do
        @bad_attr = @attr.merge({
          shortened_url: 'david'
          })

        Url.new(@bad_attr).should_not be_valid
      end

      it 'should fail when target_url is invalid' do
        @bad_attr = @attr.merge({
          target_url: 'david'
          })

        Url.new(@bad_attr).should_not be_valid
      end
    end
  end

  describe 'save' do
    it 'should enforce shortened_url uniqueness' do
      Url.create!(@attr)
      Url.new(@attr).should_not be_valid
    end
  end
end
