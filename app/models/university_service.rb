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

class UniversityService < ApplicationRecord
    belongs_to :report
    validates :position, presence: true
    validates :description, presence: true
end
