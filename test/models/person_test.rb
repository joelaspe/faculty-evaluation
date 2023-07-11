# == Schema Information
#
# Table name: people
#
#  id         :integer          not null, primary key
#  banner_id  :text
#  net_id     :text
#  first_name :text
#  last_name  :text
#  position   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
