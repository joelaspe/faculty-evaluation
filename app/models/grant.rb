# == Schema Information
#
# Table name: grants
#
#  id            :integer          not null, primary key
#  status        :integer
#  title         :text
#  duration      :text
#  total_funding :decimal(, )
#  unm_portion   :decimal(, )
#  soe_portion   :decimal(, )
#  granscol      :text
#  report_id     :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Grant < ApplicationRecord
    belongs_to :report
    has_many :grant_principle_investigators
    validates :status, numericality: {only_integer: true }
    validates :title, presence: true
    validates :total_funding, presence: true, numericality: true
    validates :unm_portion, numericality: true
    #validates :soe_portion, numericality: true
end
