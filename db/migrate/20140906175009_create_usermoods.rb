class CreateUsermoods < ActiveRecord::Migration
  def change
    create_table :usermoods do |t|
    	t.integer :rating
    	t.text :message
    	t.references :user
    	t.datetime :created_at
    	t.timestamps
    end
  end
end
