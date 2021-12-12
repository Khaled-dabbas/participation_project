class CreateAbTestGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :ab_test_groups do |t|

      t.string :group_name, index: true
      t.timestamps
    end
  end
end
