require 'test_helper'

class UserTest < ActiveSupport::TestCase

  setup do
    @user1 = FactoryGirl.create :user
    @user2 = FactoryGirl.create :user
    @user3 = FactoryGirl.create :user
  end

end
