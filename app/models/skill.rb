class Skill < ActiveRecord::Base
  has_many :talents
  has_many :users, :through => :talents

  validates :name, :uniqueness => true
  
  def user_with_proficiency(prof)
    talent = self.talents.where(proficiency: prof).first
    talent.user
  end
end
