# == Schema Information
#
# Table name: departments
#
#  id         :integer          not null, primary key
#  name       :string
#  college_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Department < ApplicationRecord
  belongs_to :college
  has_many :people
end
