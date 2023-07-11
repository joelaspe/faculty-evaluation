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

class OutreachActivity < ApplicationRecord
    belongs_to :report
    validates :name, presence: true
    validates :description, presence: true
end
