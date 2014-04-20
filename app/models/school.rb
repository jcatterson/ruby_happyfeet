class School < ActiveRecord::Base
  belongs_to :coach
  has_many :students
  validates :coach_id, presence: true
end
