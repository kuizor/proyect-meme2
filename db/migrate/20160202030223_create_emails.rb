class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :email_name

      t.timestamps null: false
    end
  end
end
