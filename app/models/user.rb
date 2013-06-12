class User < ActiveRecord::Base
  has_many :talents
  has_many :skills, :through => :talents

  def proficiency_for(skill)
  	talent = Talent.find_by_user_id_and_skill_id(self.id, skill.id)
  	talent.proficiency
  end

  def set_proficiency_for(new_skill, new_proficiency)
  	self.skills << new_skill
  	talent = Talent.find_by_user_id_and_skill_id(self.id, Skill.find_by_name(new_skill.name).id)
  	talent.update_attributes(proficiency: new_proficiency)
  end
end
