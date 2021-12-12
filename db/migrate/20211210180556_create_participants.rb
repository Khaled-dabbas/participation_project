class CreateParticipants < ActiveRecord::Migration[6.1]
  def change
    create_table :participants do |t|

      t.string :name
      t.date :dob
      t.references :ab_test_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
