class School < ActiveRecord::Base
  belongs_to :coach
  has_many :students
  validates :coach_id, presence: true
  scope :by_name, -> (name='') { where('lower(name)=?', name.downcase ) }
  scope :by_like_name, -> (name='') { where("name like ?", "%#{name}%" ) }
  
  def self.import_row( hash_row, coach )
    school_name = hash_row["Preschool or Location of Class"]
    if school_name
      school = School.by_name(school_name).first
      if school.nil?
        school = School.new
      end
      school.name = school_name
      if coach
        school.coach_id = coach.id
      end
      school.save
      school
    end
  end
  
end
