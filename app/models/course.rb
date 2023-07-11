# == Schema Information
#
# Table name: courses
#
#  id                 :integer          not null, primary key
#  course_number      :text
#  course_title       :text
#  enrollment         :integer
#  year               :integer
#  semester           :text
#  evaluation_results :text
#  taught             :boolean
#  report_id          :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Course < ApplicationRecord
    belongs_to :report
    validates :course_number, presence: true
    validates :year, presence: true, numericality: {only_integer: true}
    validates :semester, presence: true
    validates_inclusion_of :taught, :in => [true, false]
end
