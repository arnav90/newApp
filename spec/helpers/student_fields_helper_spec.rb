require 'rails_helper'

describe StudentFieldsHelper, type: :helper do
  context '#student_fields' do
    it 'should return array of fields for students of a drive' do
      drive = create(:simple_drive)
      expect(student_fields(drive)).to eql(%w(apple ball cat))
    end
  end
end