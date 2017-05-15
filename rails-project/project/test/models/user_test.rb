require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
    test "should not save user without email or email" do
    user = User.new
      assert_not user.save
      user.name = 'Test name'
      assert_not lecture.save
      user.email = 'Test email'
      assert user.save
    end
  end

end
