class CreateStudents < ActiveRecord::Migration
  def change
    enable_extension 'hstore' unless extension_enabled?('hstore')
    create_table :students do |t|
      t.hstore :details
    end
  end
end
