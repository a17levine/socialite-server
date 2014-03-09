class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :something

      t.timestamps
    end
  end
end
