class Coach < ActiveRecord::Base
  has_many :schools
  has_many :students, through: :schools
  scope :by_name, -> (coach_name='') { where("lower(first_name)=?", coach_name.downcase) }
  
  def full_name
    first_name.to_s + " " + last_name.to_s
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
      coach

    end
  end
  
end
