# == Schema Information
#
# Table name: professional_services
#
#  id          :integer          not null, primary key
#  title       :text
#  description :text
#  type        :integer
#  report_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ProfessionalServiceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
