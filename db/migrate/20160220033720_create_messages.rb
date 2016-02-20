class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :content
      t.string :title
      t.references :user, :room

      t.timestamps
    end
  end
end
