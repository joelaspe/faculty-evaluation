# == Schema Information
#
# Table name: university_services
#
#  id          :integer          not null, primary key
#  position    :text
#  type        :integer
#  description :text
#  report_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class UniversityServiceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
