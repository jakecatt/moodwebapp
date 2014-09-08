class CreateMoods < ActiveRecord::Migration
  def change
    create_table :moods do |t|
    	t.integer :rating
    	t.text :message
    	t.references :user
    	t.datetime :created_at
    	t.timestamps
    end
  end
end
