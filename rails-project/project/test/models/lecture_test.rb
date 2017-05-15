require 'test_helper'

class LectureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
    test "should not save lecture without content or attatchment" do
    lecture = Lecture.new
      assert_not lecture.save
      lecture.content = 'Test content'
      assert_not lecture.save
      lecture.attatchment = 'Test attatchment'
      assert lecture.save
    end
  end
end
