class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
  	#add_index is rails method to add index in users table, at email column
  	#with unique: true condition

  	#Adding index also solves find_by problem where a full-table scan 
  	#was previously being performed
  	add_index :users, :email, unique: true
  end
end
