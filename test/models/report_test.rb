# == Schema Information
#
# Table name: reports
#
#  id                   :integer          not null, primary key
#  report_year          :integer
#  rank                 :integer
#  department           :text
#  self_evaluation_text :text
#  future_plans_text    :text
#  person_id            :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
