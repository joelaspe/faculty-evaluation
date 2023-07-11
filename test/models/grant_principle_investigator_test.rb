# == Schema Information
#
# Table name: grant_principle_investigators
#
#  id          :integer          not null, primary key
#  first_name  :text
#  middle_name :text
#  last_name   :text
#  banner_id   :text
#  person_id   :integer
#  grant_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class GrantPrincipleInvestigatorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
