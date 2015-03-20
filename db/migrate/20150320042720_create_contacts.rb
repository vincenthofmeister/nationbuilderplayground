class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.text :payload
      t.datetime :created_at

      t.timestamps
    end
  end
end
