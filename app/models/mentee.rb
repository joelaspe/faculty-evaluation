# == Schema Information
#
# Table name: mentees
#
#  id                  :integer          not null, primary key
#  mentee_type         :integer
#  first_name          :text
#  middle_name         :text
#  last_name           :text
#  banner_id           :text
#  study_stage         :text
#  expected_graduation :datetime
#  support_source      :text
#  placement           :text
#  report_id           :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Mentee < ApplicationRecord
  belongs_to :report
  validates :first_name, presence: true
  validates :last_name, presence: true
end
