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
class Person < ApplicationRecord
  rolify
    has_many :reports
    has_many :grant_principle_investigators
    has_many :publication_coauthors
    validates :first_name, presence: true
    validates :last_name, presence: true
    #should have no spaces in the net_id
    validates :net_id, presence: true, format: { without: /\s/ }, uniqueness: true
    #banner_id should only have numbers in it 
    validates :banner_id, presence: true, numericality: {only_integer: true}, uniqueness: true
    validates :position, presence: true
end
