# == Schema Information
#
# Table name: courses
#
#  id                 :integer          not null, primary key
#  course_number      :text
#  course_title       :text
#  enrollment         :integer
#  year               :integer
#  semester           :text
#  evaluation_results :text
#  taught             :boolean
#  report_id          :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
