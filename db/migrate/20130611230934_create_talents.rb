class CreateTalents < ActiveRecord::Migration
  def change
  	create_table :talents do |t|
	  	t.references :user
	  	t.references :skill
	  	t.integer :proficiency, :default => 0
	  end
  end
end
