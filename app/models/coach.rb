class Coach < ActiveRecord::Base
  has_many :schools
  has_many :students, through: :schools
  scope :by_name, -> (coach_name) { where("lower(first_name)=?", coach_name.downcase) }
  
  def full_name
    first_name + " " + last_name
  end
  
  def self.import_row( hash_row )
    coach_first_name = hash_row["Coach"]
    if coach_first_name
      coach = Coach.by_name( coach_first_name ).first
      if coach.nil?
        coach = Coach.new
      end
      coach.first_name = coach_first_name
      coach.save
    end
  end
  
end
