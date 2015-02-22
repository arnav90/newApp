require 'rails_helper'
require "#{Rails.root}/lib/jadoo/student_helpers"

describe Jadoo do
  context '#import student' do
    context 'from csv' do
      # CSV_FILE = File.join("#{Rails.root}",'spec','data','sample_student_list.csv')
      before(:each) do
        @drive = create(:simple_drive)
      end
      it 'should read csv file and create students for a given drive' do
        Jadoo::StudentHelpers.import_from_csv(STUDENT_CSV_FILE,@drive)
        expect(@drive.students.count).to eql(5)
      end
      it 'should populate student fields in drive' do
        Jadoo::StudentHelpers.import_from_csv(STUDENT_CSV_FILE,@drive)
        expect(@drive.student_fields).to_not be_nil
      end
    end
  end
end