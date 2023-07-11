# == Schema Information
#
# Table name: grants
#
#  id            :integer          not null, primary key
#  status        :integer
#  title         :text
#  duration      :text
#  total_funding :decimal(, )
#  unm_portion   :decimal(, )
#  soe_portion   :decimal(, )
#  granscol      :text
#  report_id     :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class GrantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
