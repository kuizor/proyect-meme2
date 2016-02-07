class CreateEmailDetails < ActiveRecord::Migration
  def change
    create_table :email_details do |t|
      t.references :user, index: true, foreign_key: true
      t.references :email, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
