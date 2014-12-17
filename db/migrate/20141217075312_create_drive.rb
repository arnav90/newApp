class CreateDrive < ActiveRecord::Migration
  def change
    create_table :drives do |t|
      t.text :name
      t.hstore :details
    end

    change_table :students do|t|
      t.belongs_to :drive
    end
  end
end
