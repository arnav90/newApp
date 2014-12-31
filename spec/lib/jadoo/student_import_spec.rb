require 'rails_helper'
require "#{Rails.root}/lib/jadoo/student_import"

describe Jadoo do
  context '#import student' do
    context 'from csv' do
      CSV_FILE= File.join("#{Rails.root}",'spec','data','sample_student_list.csv')

      it 'should import file and create students for a given drive' do
        drive = create(:simple_drive)
        Jadoo::StudentImport.from_csv(CSV_FILE,drive)
        expect(drive.students.count).to eql(5)
      end
    end
  end
end