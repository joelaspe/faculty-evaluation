# == Schema Information
#
# Table name: outreach_activities
#
#  id          :integer          not null, primary key
#  name        :text
#  description :text
#  report_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class OutreachActivityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
