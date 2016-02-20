class CreateSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :sessions do |t|
      t.references :user
      t.string :action

      t.timestamps
    end
  end
end
