class CreateUsers < ActiveRecord::Migration
  #the full relation for the table created from create_table
  #has 5 rows: id, name, email, created_at, and updated_at
  #the last two are created from the t.timestamps command

  #Also, databases can be accessed for psql using psql dbname
  def change
    create_table :users do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
