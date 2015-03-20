class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :payload
      t.datetime :created_at

      t.timestamps
    end
  end
end
