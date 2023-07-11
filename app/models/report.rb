# == Schema Information
#
# Table name: reports
#
#  id                   :integer          not null, primary key
#  report_year          :integer
#  rank                 :integer
#  department           :text
#  self_evaluation_text :text
#  future_plans_text    :text
#  person_id            :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Report < ApplicationRecord
  belongs_to :person
  has_many :courses, :dependent => :destroy, inverse_of: :report
  has_many :university_services, :dependent => :destroy, inverse_of: :report
  has_many :professional_services, :dependent => :destroy, inverse_of: :report
  has_many :outreach_activities, :dependent => :destroy, inverse_of: :report
  has_many :mentees, :dependent => :destroy, inverse_of: :report
  has_many :publications, :dependent => :destroy, inverse_of: :report
  has_many :grants, :dependent => :destroy, inverse_of: :report
  accepts_nested_attributes_for :courses, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :professional_services,reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :university_services, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :outreach_activities, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :publications, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :grants, reject_if: :all_blank, allow_destroy: true 
  accepts_nested_attributes_for :mentees, reject_if: :all_blank, allow_destroy: true
  validates :report_year, presence: true, numericality: {only_integer: true}
  validates :department, presence: true

  enum rank: [:lecturer, :assistant_professor, :associate_professor, :professor]
  enum pubtype: [:refereed_journal_publications, :refereed_conference_publications, :papers_accepted_for_publication]
end
