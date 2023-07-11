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

class ProfessionalService < ApplicationRecord
    belongs_to :report
    validates :title, presence: true
    validates :description, presence: true
end
